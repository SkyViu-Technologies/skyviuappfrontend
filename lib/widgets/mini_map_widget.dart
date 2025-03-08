import 'package:flutter/material.dart';

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
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
                child: Icon(Icons.map, size: 50, color: Colors.cyanAccent)),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Location',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.cyanAccent,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Orbitron')),
                const SizedBox(height: 5),
                Text('Juja, Kiambu',
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.8), fontSize: 14)),
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
                  color: Colors.cyanAccent.withOpacity(0.3)),
              child: const Icon(Icons.location_pin,
                  color: Colors.cyanAccent, size: 20),
            ),
          ),
        ],
      ),
    );
  }
}
