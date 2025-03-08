import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SmartEye Analytics')),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFF0A0E21), Color(0xFF1A237E)],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              const Text(
                'Detection Analytics',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.cyanAccent,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Orbitron'),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 200,
                child: BarChart(
                  BarChartData(
                    borderData: FlBorderData(show: false),
                    barGroups: [
                      BarChartGroupData(x: 0, barRods: [
                        BarChartRodData(toY: 4, color: Colors.cyanAccent)
                      ]),
                      BarChartGroupData(x: 1, barRods: [
                        BarChartRodData(toY: 6, color: Colors.purpleAccent)
                      ]),
                      BarChartGroupData(x: 2, barRods: [
                        BarChartRodData(toY: 2, color: Colors.cyanAccent)
                      ]),
                    ],
                    titlesData: FlTitlesData(
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, _) {
                            switch (value.toInt()) {
                              case 0:
                                return const Text('Mar 06',
                                    style: TextStyle(color: Colors.white));
                              case 1:
                                return const Text('Mar 07',
                                    style: TextStyle(color: Colors.white));
                              case 2:
                                return const Text('Mar 08',
                                    style: TextStyle(color: Colors.white));
                            }
                            return const Text('');
                          },
                        ),
                      ),
                      leftTitles: AxisTitles(
                          sideTitles:
                              SideTitles(showTitles: true, reservedSize: 40)),
                      topTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      rightTitles:
                          AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    ),
                    maxY: 10,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildAnalyticsTile('Last Detection',
                  DateFormat('dd-MMM-yyyy').format(DateTime.now())),
              _buildAnalyticsTile(
                  'Time', DateFormat('hh:mm a').format(DateTime.now())),
              _buildAnalyticsTile('Intruders Detected', '3'),
              _buildAnalyticsTile('Images Captured', '5'),
              _buildAnalyticsTile('System Uptime', '48 hrs'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAnalyticsTile(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: const TextStyle(
                  color: Colors.white, fontSize: 16, fontFamily: 'Orbitron')),
          Text(value,
              style: const TextStyle(color: Colors.cyanAccent, fontSize: 16)),
        ],
      ),
    );
  }
}
