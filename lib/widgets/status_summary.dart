import 'package:flutter/material.dart';

class StatusSummary extends StatelessWidget {
  const StatusSummary({super.key});

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
          const Text('System Status',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.cyanAccent,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Orbitron')),
          const SizedBox(height: 10),
          _buildStatusRow(Icons.power, 'Power', '5V'),
          _buildStatusRow(Icons.wifi, 'Connection', 'Strong'),
          _buildStatusRow(Icons.security, 'Status', 'Active'),
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
          Text('$label:',
              style:
                  const TextStyle(color: Colors.white, fontFamily: 'Orbitron')),
          const SizedBox(width: 8),
          Text(value, style: const TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }
}
