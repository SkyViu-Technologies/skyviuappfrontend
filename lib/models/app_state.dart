import 'package:flutter/material.dart';

class AppState with ChangeNotifier {
  String _deviceId = '';
  List<Map<String, String>> _alerts = [];
  bool _isConnected = false;

  String get deviceId => _deviceId;
  List<Map<String, String>> get alerts => _alerts;
  bool get isConnected => _isConnected;

  void setDeviceId(String id) {
    _deviceId = id;
    _isConnected = true;
    notifyListeners();
    // Backend: Connect to SmartEye device via WebSocket or HTTP
  }

  void addAlert(String title, String subtitle) {
    _alerts.add({'title': title, 'subtitle': subtitle});
    notifyListeners();
    // Backend: Sync with server
  }

  void clearAlert(int index) {
    _alerts.removeAt(index);
    notifyListeners();
    // Backend: Mark as resolved
  }
}
