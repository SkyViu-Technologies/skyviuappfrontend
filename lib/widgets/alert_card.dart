import 'package:flutter/material.dart';

class AlertCard extends StatelessWidget {
  const AlertCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/alerts');
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.redAccent.withOpacity(0.4)),
          boxShadow: [
            BoxShadow(
              color: Colors.redAccent.withOpacity(0.3),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: ListTile(
          leading: const Icon(Icons.warning, color: Colors.redAccent),
          title: const Text(
            'Anomaly Detected',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          subtitle: const Text(
            'Suspicious Object at 10:32 AM',
            style: TextStyle(color: Colors.white70),
          ),
        ),
      ),
    );
  }
}
