import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/app_state.dart';

class AlertsScreen extends StatelessWidget {
  const AlertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(title: const Text('SmartEye Alerts')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0A0E21), Color(0xFF1A237E)],
          ),
        ),
        child: appState.alerts.isEmpty
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      size: 80,
                      color: Colors.cyanAccent,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'No Alerts',
                      style: TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 24,
                        color: Colors.cyanAccent,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: Colors.cyanAccent.withOpacity(0.5),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'All systems are clear!',
                      style: TextStyle(
                        fontFamily: 'Orbitron',
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: appState.alerts.length,
                itemBuilder: (context, index) {
                  final alert = appState.alerts[index];
                  return ListTile(
                    leading: const Icon(Icons.warning, color: Colors.redAccent),
                    title: Text(
                      alert['title']!,
                      style: const TextStyle(
                          color: Colors.white, fontFamily: 'Orbitron'),
                    ),
                    subtitle: Text(
                      alert['subtitle']!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.check, color: Colors.cyanAccent),
                      onPressed: () {
                        appState.clearAlert(index);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Alert acknowledged')),
                        );
                      },
                    ),
                    onTap: () {
                      if (alert['title'] == 'Image Captured') {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            backgroundColor: Colors.black.withOpacity(0.9),
                            content: CachedNetworkImage(
                              imageUrl:
                                  'https://via.placeholder.com/300', // Replace with actual image URL from backend
                              placeholder: (context, url) =>
                                  const CircularProgressIndicator(
                                      color: Colors.cyanAccent),
                              errorWidget: (context, url, error) => const Icon(
                                  Icons.error,
                                  color: Colors.redAccent),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(
                                  'Close',
                                  style: TextStyle(color: Colors.cyanAccent),
                                ),
                              ),
                            ],
                          ),
                        );
                      }
                    },
                  );
                },
              ),
      ),
    );
  }
}
