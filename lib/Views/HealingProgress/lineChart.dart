import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'healinglevel.dart';

class LineChartWidget extends StatelessWidget {
  final List<HealingLevels> points;

  const LineChartWidget(this.points, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: points
                  .map((point) => FlSpot(point.x.millisecondsSinceEpoch.toDouble(), point.y))
                  .toList(),
              isCurved: false,
              dotData: FlDotData(show: true),
            ),
          ],
          titlesData: FlTitlesData(
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles( axisNameWidget: Text('Healing progress level'),
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  return Text(value.toString(), style: TextStyle(color: Colors.black, fontSize: 12));
                },
                reservedSize: 28,
              ),
            ),
            bottomTitles: AxisTitles( axisNameWidget: Text('Time period'),
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  final date = DateTime.fromMillisecondsSinceEpoch(value.toInt());
                  return Text(DateFormat('dd/MM/yyyy').format(date), style: TextStyle(color: Colors.black, fontSize: 12));
                },
                reservedSize: 22,
              
              ),
            ),
          ),
        ),
      ),
    );
  }
}