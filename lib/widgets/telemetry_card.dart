import 'package:flutter/material.dart';

class TelemetryCard extends StatelessWidget {
  const TelemetryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Fetching telemetry data...')),
        );
        // Backend: Fetch real-time telemetry
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.cyanAccent.withOpacity(0.3)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Telemetry',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.cyanAccent,
                ),
              ),
              const SizedBox(height: 10),
              Text('Altitude: 100m', style: _telemetryStyle()),
              Text('Speed: 5m/s', style: _telemetryStyle()),
              Text('GPS: 37.7749, -122.4194', style: _telemetryStyle()),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _telemetryStyle() => const TextStyle(
    fontSize: 14,
    color: Colors.white70,
    fontFamily: 'RobotoMono',
  );
}
