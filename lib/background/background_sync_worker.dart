import 'package:flutter/foundation.dart';
import 'package:workmanager/workmanager.dart';

const String backgroundSyncTaskKey = 'com.quiznest.background_question_sync';

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    if (taskName == backgroundSyncTaskKey) {
      try {
        // Headless background sync execution
        // Will check remote manifest and sync missing packs if connected
        return true;
      } catch (_) {
        return false;
      }
    }
    return true;
  });
}

class BackgroundSyncManager {
  BackgroundSyncManager._();

  static Future<void> initialize() async {
    if (kIsWeb) return; // Background workmanager not active on web

    try {
      await Workmanager().initialize(
        callbackDispatcher,
      );

      // Register periodic sync: runs roughly every 6-12 hours when connected to network
      await Workmanager().registerPeriodicTask(
        'quiznest_periodic_sync',
        backgroundSyncTaskKey,
        frequency: const Duration(hours: 6),
        constraints: Constraints(
          networkType: NetworkType.connected,
          requiresBatteryNotLow: true,
        ),
        existingWorkPolicy: ExistingPeriodicWorkPolicy.keep,
      );
    } catch (e) {
      debugPrint('Workmanager init note: $e');
    }
  }
}
