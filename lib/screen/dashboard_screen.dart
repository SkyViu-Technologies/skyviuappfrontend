import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';
import '../widgets/camera_feed_card.dart';
import '../widgets/telemetry_card.dart';
import '../widgets/alert_card.dart';
import '../widgets/analytics_card.dart';
import '../widgets/status_summary.dart';
import '../widgets/mini_map_widget.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  void _showLoginDialog(BuildContext context) {
    final TextEditingController deviceIdController = TextEditingController();
    final appState = Provider.of<AppState>(context, listen: false);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.black.withOpacity(0.9),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Connect to SmartEye',
          style: TextStyle(color: Colors.cyanAccent, fontFamily: 'Orbitron'),
        ),
        content: TextField(
          controller: deviceIdController,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            labelText: 'Device ID',
            labelStyle: TextStyle(color: Colors.grey),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.cyanAccent)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.cyanAccent)),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel',
                style: TextStyle(color: Colors.cyanAccent)),
          ),
          TextButton(
            onPressed: () {
              final deviceId = deviceIdController.text.trim();
              if (deviceId.isNotEmpty) {
                appState.setDeviceId(deviceId);
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Connected to Device ID: $deviceId')));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Enter a valid Device ID')));
              }
            },
            child: const Text('Connect',
                style: TextStyle(color: Colors.cyanAccent)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('SmartEye Dashboard'),
        actions: [
          IconButton(
            icon: Icon(appState.isConnected ? Icons.link : Icons.link_off,
                color: Colors.cyanAccent),
            onPressed: () => _showLoginDialog(context),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0A0E21), Color(0xFF1A237E)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 1.2,
                    children: const [
                      CameraFeedCard(),
                      TelemetryCard(),
                      AlertCard(),
                      AnalyticsCard(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const StatusSummary(),
                const SizedBox(height: 20),
                const Expanded(flex: 1, child: MiniMapWidget()),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0A0E21),
              Color(0xFF1A237E)
            ], // Matching dashboard gradient
          ),
          borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: BottomNavigationBar(
          backgroundColor: Colors.transparent, // Ensure gradient is visible
          elevation: 0, // No shadow
          selectedItemColor: Colors.cyanAccent,
          unselectedItemColor: Colors.grey,
          currentIndex: 0,
          onTap: (index) {
            switch (index) {
              case 0:
                Navigator.pushNamed(context, '/dashboard');
                break;
              case 1:
                Navigator.pushNamed(context, '/alerts');
                break;
              case 2:
                Navigator.pushNamed(context, '/analytics');
                break;
              case 3:
                Navigator.pushNamed(context, '/settings');
                break;
            }
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.dashboard), label: 'Dashboard'),
            BottomNavigationBarItem(icon: Icon(Icons.warning), label: 'Alerts'),
            BottomNavigationBarItem(
                icon: Icon(Icons.analytics), label: 'Analytics'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
          ],
        ),
      ),
    );
  }
}
