/*
 * Copyright (c) 2025. BeyondSouls. All rights reserved.
 * Author: Parshuram Pathave
 *
 */

import 'dart:async';
import 'package:flutter/material.dart';

class SessionManager {
  static Timer? _timer;
  static bool _isSessionActive = false;  // Tracks session state
  static const int sessionTimeout = 30 * 60; // 30 minutes in seconds

  static VoidCallback? onLogout; // Logout callback

  /// Starts the session timer
  static void startSession() {
    _resetTimer();
  }

  /// Resets the session timer on user interaction
  static void _resetTimer() {
    _timer?.cancel();
    _isSessionActive = true;
    _timer = Timer(const Duration(seconds: sessionTimeout), () {
      _isSessionActive = false; // Session expired
      _logoutUser();
    });
  }

  /// Logs out the user and clears session
  static Future<void> _logoutUser() async {
    onLogout?.call(); // Call logout function
  }

  /// Call this method on user interaction
  static void userInteracted() {
    _resetTimer();
  }

  /// Dispose the timer when app is closed
  static void dispose() {
    _timer?.cancel();
    _isSessionActive = false;
  }

  /// Check if session is still active
  static bool isSessionActive() {
    return _isSessionActive;
  }

  /// Check if session expired
  static bool isSessionExpired() {
    return !_isSessionActive;
  }
}
