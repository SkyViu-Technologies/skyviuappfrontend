import 'package:flutter/material.dart';

class TelemetryCard extends StatelessWidget {
  const TelemetryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Fetching telemetry data...')));
        // Backend: Fetch real-time telemetry via WebSocket
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.cyanAccent.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
                color: Colors.cyanAccent.withOpacity(0.2),
                blurRadius: 10,
                spreadRadius: 2)
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Telemetry',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.cyanAccent,
                      fontFamily: 'Orbitron')),
              const SizedBox(height: 10),
              Text('Temp: 32°C', style: _telemetryStyle()),
              Text('Power: 5V', style: _telemetryStyle()),
              Text('Status: Active', style: _telemetryStyle()),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _telemetryStyle() => const TextStyle(
      fontSize: 14, color: Colors.white70, fontFamily: 'RobotoMono');
}
