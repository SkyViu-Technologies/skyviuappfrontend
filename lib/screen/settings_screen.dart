import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SmartEye Settings')),
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
            const Text(
              'System Configuration',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.cyanAccent,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Orbitron'),
            ),
            _buildConfigTile(context, 'Detection Sensitivity',
                'Medium (Default)', ['Low', 'Medium', 'High']),
            _buildConfigTile(context, 'Camera Resolution', '720p (Default)',
                ['480p', '720p', '1080p']),
            _buildConfigTile(context, 'Notification Mode', 'Email (Default)',
                ['Email', 'Push', 'Both']),
            _buildConfigTile(context, 'Storage Limit', '1GB (Default)',
                ['500MB', '1GB', '2GB']),
            const SizedBox(height: 20),
            const Text(
              'Team Acknowledgments',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.cyanAccent,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Orbitron'),
            ),
            _buildTeamMember('assets/ken.jpeg', 'Kennedy Wanakacha',
                'Frontend & UI/UX Developer'),
            _buildTeamMember('assets/prince.jpeg', 'Princeton Mwachala',
                'Cloud & Backend Engineer'),
            _buildTeamMember('assets/aprel.jpeg', 'Derrick Richards',
                'Cybersecurity & DevOps Engineer'),
            _buildTeamMember('assets/mwegs.jpeg', 'John Mwega',
                'AI & Embedded Systems Engineer'),
            _buildTeamMember(
                'assets/ron.jpeg', 'Rony Maruga', 'Hardware & IoT Engineer'),
          ],
        ),
      ),
    );
  }

  Widget _buildConfigTile(BuildContext context, String title,
      String currentValue, List<String> options) {
    return ListTile(
      title: Text(title,
          style: const TextStyle(color: Colors.white, fontFamily: 'Orbitron')),
      subtitle: Text(currentValue, style: const TextStyle(color: Colors.grey)),
      trailing: const Icon(Icons.arrow_forward_ios, color: Colors.cyanAccent),
      onTap: () {
        showModalBottomSheet(
          context: context,
          backgroundColor: Colors.black.withOpacity(0.9),
          builder: (context) => Column(
            mainAxisSize: MainAxisSize.min,
            children: options
                .map((option) => ListTile(
                      title: Text(option,
                          style: const TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('$title set to $option')));
                        // Backend: Update SmartEye config via HTTP
                      },
                    ))
                .toList(),
          ),
        );
      },
    );
  }

  Widget _buildTeamMember(String imagePath, String name, String role) {
    return Card(
      color: Colors.black.withOpacity(0.7),
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading:
            CircleAvatar(radius: 25, backgroundImage: AssetImage(imagePath)),
        title: Text(name,
            style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Orbitron')),
        subtitle: Text(role, style: const TextStyle(color: Colors.grey)),
      ),
    );
  }
}
