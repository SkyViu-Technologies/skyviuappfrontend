import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnalyticsCard extends StatelessWidget {
  const AnalyticsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/analytics'),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.7),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.purpleAccent.withOpacity(0.3)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Analytics',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.purpleAccent,
                      fontFamily: 'Orbitron')),
              const SizedBox(height: 10),
              SizedBox(
                height: 80,
                child: BarChart(
                  BarChartData(
                    borderData: FlBorderData(show: false),
                    barGroups: [
                      BarChartGroupData(x: 0, barRods: [
                        BarChartRodData(
                            toY: 4,
                            color: Colors.cyanAccent,
                            width: 10,
                            borderRadius: BorderRadius.circular(4))
                      ]),
                      BarChartGroupData(x: 1, barRods: [
                        BarChartRodData(
                            toY: 6,
                            color: Colors.purpleAccent,
                            width: 10,
                            borderRadius: BorderRadius.circular(4))
                      ]),
                      BarChartGroupData(x: 2, barRods: [
                        BarChartRodData(
                            toY: 2,
                            color: Colors.cyanAccent,
                            width: 10,
                            borderRadius: BorderRadius.circular(4))
                      ]),
                    ],
                    gridData: FlGridData(show: false),
                    titlesData: FlTitlesData(show: false),
                    maxY: 10,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
