import 'package:flutter/material.dart';
import '../widgets/drone_feed_card.dart';
import '../widgets/telemetry_card.dart';
import '../widgets/alert_card.dart';
import '../widgets/analytics_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  void _showLoginDialog(BuildContext context) {
    final TextEditingController droneIdController = TextEditingController();

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            backgroundColor: Colors.black.withOpacity(0.8),
            title: const Text(
              'Login with Drone ID',
              style: TextStyle(color: Colors.cyanAccent),
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: droneIdController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    labelText: 'Drone ID',
                    labelStyle: TextStyle(color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyanAccent),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.cyanAccent),
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.cyanAccent),
                ),
              ),
              TextButton(
                onPressed: () {
                  final droneId = droneIdController.text.trim();
                  if (droneId.isNotEmpty) {
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Tuning Drone ID: $droneId')),
                    );
                    // Backend: Authenticate drone ID and tune drone to app
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Enter a valid Drone ID')),
                    );
                  }
                },
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.cyanAccent),
                ),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('SkyViu-AI Surveillance'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Colors.cyanAccent),
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
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 20.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2, // Cards take more space
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16.0,
                    mainAxisSpacing: 16.0,
                    childAspectRatio: 1.2,
                    children: const [
                      DroneFeedCard(),
                      TelemetryCard(),
                      AlertCard(),
                      AnalyticsCard(),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const DroneStatusSummary(),
                const SizedBox(height: 20),
                const Expanded(
                  flex: 1, // Mini map takes remaining space
                  child: MiniMapWidget(),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black.withOpacity(0.8),
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
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.warning), label: 'Alerts'),
          BottomNavigationBarItem(
            icon: Icon(Icons.analytics),
            label: 'Analytics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class DroneStatusSummary extends StatelessWidget {
  const DroneStatusSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.cyanAccent.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Drone Status',
            style: TextStyle(
              fontSize: 18,
              color: Colors.cyanAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          _buildStatusRow(Icons.battery_full, 'Battery', '85%'),
          _buildStatusRow(Icons.signal_wifi_4_bar, 'Connection', 'Strong'),
          _buildStatusRow(Icons.flight, 'Mission', 'Active - Surveillance'),
        ],
      ),
    );
  }

  Widget _buildStatusRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.cyanAccent, size: 20),
          const SizedBox(width: 10),
          Text('$label:', style: const TextStyle(color: Colors.white)),
          const SizedBox(width: 8),
          Text(value, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}

class MiniMapWidget extends StatelessWidget {
  const MiniMapWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.7),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.cyanAccent.withOpacity(0.3)),
      ),
      child: Stack(
        children: [
          // Placeholder for map (replace with real map widget later)
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: Icon(Icons.map, size: 50, color: Colors.cyanAccent),
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mini Map',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.cyanAccent,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Location: 37.7749, -122.4194',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Container(
              padding: const EdgeInsets.all(4.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.cyanAccent.withOpacity(0.3),
              ),
              child: const Icon(
                Icons.location_pin,
                color: Colors.cyanAccent,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
