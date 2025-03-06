import 'package:flutter/material.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Alerts')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0A0E21), Color(0xFF1A237E)],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16.0),
          children: [
            ListTile(
              leading: const Icon(Icons.warning, color: Colors.redAccent),
              title: const Text(
                'Anomaly Detected',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: const Text(
                '10:32 AM - Suspicious Object',
                style: TextStyle(color: Colors.grey),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.check, color: Colors.cyanAccent),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Alert acknowledged')),
                  );
                  // Backend: Mark alert as resolved
                },
              ),
            ),
            // Add more alerts dynamically from backend
          ],
        ),
      ),
    );
  }
}
