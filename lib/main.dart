import 'package:flutter/material.dart';
import 'screen/dashboard_screen.dart';
import 'screen/alerts_screen.dart';
import 'screen/analytics_screen.dart';
import 'screen/settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove debug banner
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.cyanAccent,
        scaffoldBackgroundColor: const Color(0xFF0A0E21), // Deep dark blue
        cardColor: Colors.black.withOpacity(0.7), // Semi-transparent cards
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: Colors.white, fontFamily: 'RobotoMono'),
          titleLarge: TextStyle(
            color: Colors.cyanAccent,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.cyanAccent,
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: '/dashboard',
      routes: {
        '/dashboard': (context) => const DashboardScreen(),
        '/alerts': (context) => const AlertsScreen(),
        '/analytics': (context) => const AnalyticsScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
