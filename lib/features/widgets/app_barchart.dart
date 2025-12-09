import 'package:flutter/material.dart';
import 'package:ragda_news/core/constans/app_colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../core/constans/app_text_style.dart';

class AppBarchart extends StatelessWidget {
  const AppBarchart({super.key});

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      tooltipBehavior: TooltipBehavior(
        enable: true,
        builder:
            (
              dynamic data,
              dynamic point,
              dynamic series,
              int pointIndex,
              int seriesIndex,
            ) {
              // data adalah objek ChartData
              ChartData chartData = data as ChartData;
              return Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  'Total: ${chartData.quantity}',
                  style: const TextStyle(color: Colors.white),
                ),
              );
            },
      ),
      primaryYAxis: NumericAxis(
        title: AxisTitle(text: 'Part Quantity', textStyle: AppTextStyle.h8Bold),
        axisLine: AxisLine(width: 0, color: AppColors.white),
      ),
      primaryXAxis: CategoryAxis(
        title: AxisTitle(text: 'Months'),
        majorGridLines: MajorGridLines(width: 0),
        axisLine: AxisLine(width: 0),
      ),
      borderColor: Colors.transparent,
      borderWidth: 0,
      series: <CartesianSeries>[
        ColumnSeries<ChartData, String>(
          dataSource: getChartData(),
          xValueMapper: (ChartData data, _) => data.month,
          yValueMapper: (ChartData data, _) => data.quantity,
          borderRadius: BorderRadius.circular(4),
          dataLabelSettings: DataLabelSettings(isVisible: false),
        ),
      ],
    );
  }

  List<ChartData> getChartData() {
    return [
      ChartData('Jan', 10),
      ChartData('Feb', 15),
      ChartData('Mar', 5),
      ChartData('Apr', 20),
      ChartData('May', 12),
      ChartData('Jun', 8),
      ChartData('Jul', 30),
      ChartData('Aug', 5),
      ChartData('Sep', 10),
      ChartData('Oct', 10),
      ChartData('Nov', 25),
      ChartData('Dec', 18),
    ];
  }
}

class ChartData {
  final String month;
  final int quantity;

  ChartData(this.month, this.quantity);
}
