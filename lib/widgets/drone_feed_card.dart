import 'package:flutter/material.dart';

class DroneFeedCard extends StatelessWidget {
  const DroneFeedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.videocam, size: 50),
          SizedBox(height: 8.0),
          Text('Live Feed', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}
