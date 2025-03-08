import 'package:flutter/material.dart';

class CameraFeedCard extends StatelessWidget {
  const CameraFeedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Opening camera feed...')));
        // Backend: Start live camera stream via WebSocket or WebRTC
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [Colors.cyanAccent, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
                color: Colors.cyanAccent.withOpacity(0.3),
                blurRadius: 15,
                spreadRadius: 2)
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.camera_alt, size: 60, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              'Camera Feed',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Orbitron',
                shadows: [
                  Shadow(
                      color: Colors.cyanAccent.withOpacity(0.5), blurRadius: 10)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
