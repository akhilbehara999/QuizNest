import 'dart:convert';
import 'package:crypto/crypto.dart';

class ChecksumUtil {
  ChecksumUtil._();

  /// Computes the hex SHA-256 digest of a string payload.
  static String computeSha256(String content) {
    final bytes = utf8.encode(content);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  /// Verifies whether the content matches the expected checksum.
  /// If expectedChecksum is empty or null, returns true (checksum optional).
  static bool verifySha256(String content, String? expectedChecksum) {
    if (expectedChecksum == null || expectedChecksum.trim().isEmpty) {
      return true;
    }
    final computed = computeSha256(content).toLowerCase();
    return computed == expectedChecksum.trim().toLowerCase();
  }
}
