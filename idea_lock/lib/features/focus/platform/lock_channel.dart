import 'dart:io';
import 'package:flutter/services.dart';

/// Platform bridge for Android Kiosk lock mode.
/// On iOS, all methods are no-ops — the Flutter overlay handles UX.
class LockChannel {
  static const _channel = MethodChannel('com.idealock/lock_channel');

  /// Start the focus lock. [durationSeconds] drives the Android watchdog.
  static Future<void> startLock(int durationSeconds) async {
    if (!Platform.isAndroid) return;
    await _channel.invokeMethod<void>('startLock', {'duration': durationSeconds});
  }

  /// Stop the focus lock and release the Accessibility Service.
  static Future<void> stopLock() async {
    if (!Platform.isAndroid) return;
    await _channel.invokeMethod<void>('stopLock');
  }

  /// Returns whether the lock is currently active (Android only).
  static Future<bool> isLockActive() async {
    if (!Platform.isAndroid) return false;
    return await _channel.invokeMethod<bool>('isLockActive') ?? false;
  }

  /// Send a heartbeat to reset the Android watchdog timer.
  static Future<void> heartbeat() async {
    if (!Platform.isAndroid) return;
    await _channel.invokeMethod<void>('heartbeat');
  }
}
