import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screen/dashboard_screen.dart';
import 'screen/alerts_screen.dart';
import 'screen/analytics_screen.dart';
import 'screen/settings_screen.dart';
import 'models/app_state.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppState(),
      child: const SmartEyeApp(),
    ),
  );
}

class SmartEyeApp extends StatelessWidget {
  const SmartEyeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartEye',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          titleTextStyle: TextStyle(
            fontFamily: 'Orbitron',
            fontSize: 20,
            color: Colors.cyanAccent,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white)),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor:
              Colors.transparent, // Ensure transparency for gradient
          elevation: 0,
          selectedItemColor: Colors.cyanAccent,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed, 
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
