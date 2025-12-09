import 'package:flutter/material.dart';
import 'package:ragda_news/core/constans/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AppBarChart extends StatelessWidget {
  AppBarChart({super.key});

  final pilateColor = AppColors.danger;
  final cyclingColor = AppColors.black50;
  final quickWorkoutColor = AppColors.primary;

  final buildingAColor = const Color(0xFF81D4FA);
  final buildingA1Color = const Color(0xFF00ACC1);
  final buildingBColor = const Color(0xFF42A5F5);
  final buildingB1Color = const Color(0xFFAB47BC);
  final buildingC1Color = const Color(0xFF7E57C2);
  final averageLineColor = const Color(0xFF1976D2);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        SizedBox(
          height: 300,
          child: SfCartesianChart(
            legend: Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              overflowMode: LegendItemOverflowMode.wrap,
              alignment: ChartAlignment.center,
              textStyle: const TextStyle(fontSize: 12),
            ),

            // Tooltip
            tooltipBehavior: TooltipBehavior(
              enable: true,
              format: 'point.x : point.y',
            ),

            primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
              labelStyle: const TextStyle(fontSize: 10),
            ),
            primaryYAxis: NumericAxis(
              interval: 2,
              axisLine: const AxisLine(width: 0),
              majorTickLines: const MajorTickLines(size: 0),
              title: AxisTitle(
                text: 'Frequency',
                textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            axes: <ChartAxis>[
              NumericAxis(
                name: 'yAxisAverage',
                opposedPosition: true,
                interval: 4,
                majorGridLines: const MajorGridLines(width: 0),
                axisLine: const AxisLine(width: 0),
                title: AxisTitle(
                  text: 'Average',
                  textStyle: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],

            series: <CartesianSeries>[
              StackedColumnSeries<ChartData, String>(
                dataSource: _getChartData(),
                xValueMapper: (ChartData data, _) => data.date,
                yValueMapper: (ChartData data, _) => data.buildingA,
                name: 'Building A',
                color: buildingA1Color,
                width: 0.5,
                borderRadius: BorderRadius.zero,
              ),

              StackedColumnSeries<ChartData, String>(
                dataSource: _getChartData(),
                xValueMapper: (ChartData data, _) => data.date,
                yValueMapper: (ChartData data, _) => data.buildingA1,
                name: 'Building A1',
                color: buildingA1Color,
                width: 0.5,
                borderRadius: BorderRadius.zero,
              ),

              StackedColumnSeries<ChartData, String>(
                dataSource: _getChartData(),
                xValueMapper: (ChartData data, _) => data.date,
                yValueMapper: (ChartData data, _) => data.buildingB,
                name: 'Building B',
                color: buildingBColor,
                width: 0.5,
                borderRadius: BorderRadius.zero,
              ),

              StackedColumnSeries<ChartData, String>(
                dataSource: _getChartData(),
                xValueMapper: (ChartData data, _) => data.date,
                yValueMapper: (ChartData data, _) => data.buildingB1,
                name: 'Building B1',
                color: buildingB1Color,
                width: 0.5,
                borderRadius: BorderRadius.zero,
              ),
              StackedColumnSeries<ChartData, String>(
                dataSource: _getChartData(),
                xValueMapper: (ChartData data, _) => data.date,
                yValueMapper: (ChartData data, _) => data.buildingC1,
                name: 'Building C1',
                color: buildingC1Color,
                width: 0.5,
                borderRadius: BorderRadius.zero,
              ),

              LineSeries<ChartData, String>(
                dataSource: _getChartData(),
                xValueMapper: (ChartData data, _) => data.date,
                yValueMapper: (ChartData data, _) => data.average,
                yAxisName: 'yAxisAverage',
                name: 'Average',
                color: AppColors.primary,
                width: 2,
                markerSettings: MarkerSettings(
                  isVisible: true,
                  shape: DataMarkerType.circle,
                  width: 8,
                  height: 8,
                  borderColor: AppColors.white,
                  color: AppColors.primary,
                  borderWidth: 2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Data untuk chart
  List<ChartData> _getChartData() {
    return [
      ChartData('22/08/2024', 1.2, 0.8, 1.0, 0.5, 0.5, 4),
      ChartData('25/08/2024', 2.0, 1.5, 1.0, 1.0, 1.0, 7),
      ChartData('26/08/2024', 0.3, 0.2, 0.3, 0.2, 0.3, 4),
      ChartData('27/08/2024', 1.0, 0.8, 0.7, 0.5, 0.5, 6),
      ChartData('28/08/2024', 2.0, 1.5, 1.2, 0.8, 1.0, 8),
      ChartData('29/08/2024', 0, 0, 0, 3, 0, 1),
    ];
  }
}

class ChartData {
  ChartData(
    this.date,
    this.buildingA,
    this.buildingA1,
    this.buildingB,
    this.buildingB1,
    this.buildingC1,
    this.average,
  );

  final String date;
  final double buildingA;
  final double buildingA1;
  final double buildingB;
  final double buildingB1;
  final double buildingC1;
  final double average;
}
