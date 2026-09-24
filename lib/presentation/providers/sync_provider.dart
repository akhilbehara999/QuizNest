import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/constants/app_constants.dart';
import '../../domain/repositories/sync_repository.dart';
import 'core_providers.dart';

class SyncState {
  final bool isSyncing;
  final DateTime? lastSyncTime;
  final SyncResult? lastResult;
  final bool autoSyncEnabled;
  final bool wifiOnly;
  final int localManifestVersion;

  const SyncState({
    this.isSyncing = false,
    this.lastSyncTime,
    this.lastResult,
    this.autoSyncEnabled = true,
    this.wifiOnly = false,
    this.localManifestVersion = 1,
  });

  SyncState copyWith({
    bool? isSyncing,
    DateTime? lastSyncTime,
    SyncResult? lastResult,
    bool? autoSyncEnabled,
    bool? wifiOnly,
    int? localManifestVersion,
  }) {
    return SyncState(
      isSyncing: isSyncing ?? this.isSyncing,
      lastSyncTime: lastSyncTime ?? this.lastSyncTime,
      lastResult: lastResult ?? this.lastResult,
      autoSyncEnabled: autoSyncEnabled ?? this.autoSyncEnabled,
      wifiOnly: wifiOnly ?? this.wifiOnly,
      localManifestVersion: localManifestVersion ?? this.localManifestVersion,
    );
  }
}

class SyncNotifier extends Notifier<SyncState> {
  @override
  SyncState build() {
    Future.microtask(() => _init());
    return const SyncState();
  }

  Future<void> _init() async {
    final prefs = ref.read(sharedPreferencesProvider);
    final syncRepo = ref.read(syncRepositoryProvider);

    final autoSync = prefs.getBool(AppConstants.prefKeyAutoSyncEnabled) ?? true;
    final wifiOnly = prefs.getBool(AppConstants.prefKeyWifiOnly) ?? false;
    final lastSyncStr = prefs.getString(AppConstants.prefKeyLastSyncTime);
    final lastSync = lastSyncStr != null ? DateTime.tryParse(lastSyncStr) : null;
    final localVersion = await syncRepo.getLocalManifestVersion();

    state = state.copyWith(
      autoSyncEnabled: autoSync,
      wifiOnly: wifiOnly,
      lastSyncTime: lastSync,
      localManifestVersion: localVersion,
    );

    // Setup network listener for lightweight auto-sync when network reconnects
    Connectivity().onConnectivityChanged.listen((results) {
      final isConnected = results.any((r) => r != ConnectivityResult.none);
      if (isConnected && state.autoSyncEnabled) {
        triggerSync(userInitiated: false);
      }
    });
  }

  Future<SyncResult> triggerSync({bool userInitiated = false}) async {
    if (state.isSyncing) {
      return state.lastResult ??
          SyncResult.failure('Sync already running in background');
    }

    // Check wifi-only constraint
    if (state.wifiOnly) {
      final connectivity = await Connectivity().checkConnectivity();
      final hasWifi = connectivity.contains(ConnectivityResult.wifi);
      if (!hasWifi) {
        final result = SyncResult.failure(
            'Skipped sync: Wi-Fi only mode enabled and not on Wi-Fi');
        state = state.copyWith(lastResult: result);
        return result;
      }
    }

    state = state.copyWith(isSyncing: true);

    try {
      final syncRepo = ref.read(syncRepositoryProvider);
      // Fetch fresh questions from OpenTDB to replenish solved ones
      final result = await syncRepo.replenishSolvedQuestions();
      final lastSync = DateTime.now();
      final localVersion = await syncRepo.getLocalManifestVersion();

      state = state.copyWith(
        isSyncing: false,
        lastResult: result,
        lastSyncTime: lastSync,
        localManifestVersion: localVersion,
      );

      return result;
    } catch (e) {

      final result = SyncResult.failure(e.toString());
      state = state.copyWith(
        isSyncing: false,
        lastResult: result,
      );
      return result;
    }
  }

  Future<void> toggleAutoSync(bool enabled) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setBool(AppConstants.prefKeyAutoSyncEnabled, enabled);
    state = state.copyWith(autoSyncEnabled: enabled);
  }

  Future<void> toggleWifiOnly(bool wifiOnly) async {
    final prefs = ref.read(sharedPreferencesProvider);
    await prefs.setBool(AppConstants.prefKeyWifiOnly, wifiOnly);
    state = state.copyWith(wifiOnly: wifiOnly);
  }
}

final syncProvider =
    NotifierProvider<SyncNotifier, SyncState>(SyncNotifier.new);
