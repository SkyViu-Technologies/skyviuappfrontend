import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/app_state.dart';

class AlertCard extends StatelessWidget {
  const AlertCard({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final latestAlert = appState.alerts.isNotEmpty
        ? appState.alerts.last
        : {'title': 'No Alerts', 'subtitle': 'All clear'};
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/alerts'),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.redAccent.withOpacity(0.4)),
          boxShadow: [
            BoxShadow(
                color: Colors.redAccent.withOpacity(0.3),
                blurRadius: 10,
                spreadRadius: 1)
          ],
        ),
        child: ListTile(
          leading: const Icon(Icons.warning, color: Colors.redAccent),
          title: Text(latestAlert['title']!,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Orbitron')),
          subtitle: Text(latestAlert['subtitle']!,
              style: const TextStyle(color: Colors.white70)),
        ),
      ),
    );
  }
}
