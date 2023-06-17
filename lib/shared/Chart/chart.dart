import 'package:assignment1/models/chart_model.dart';
import 'package:assignment1/providers/ChartProvider/chart_provider.dart';
import 'package:assignment1/shared/Spinner/spinner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:assignment1/utils/helpers.dart';

class Chart extends StatelessWidget {
  final String title;

  const Chart({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return context.watch<ChartProvider>().chartData.isNotEmpty
        ? SfCartesianChart(
            title: ChartTitle(
                text: title,
                textStyle: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade900)),
            onDataLabelRender: (args) {
              args.text = getDateFromMilliSeconds(int.parse(args.text));
            },
            primaryXAxis: CategoryAxis(labelRotation: 90),
            primaryYAxis: NumericAxis(
              axisLabelFormatter: (AxisLabelRenderDetails args) {
                String date = getDateFromMilliSeconds(args.value.toInt());
                return ChartAxisLabel(date, args.textStyle);
              },
              name: 'primaryYAxis',
              rangePadding: ChartRangePadding.additional,
            ),
            series: <ChartSeries<ChartData, String>>[
              ColumnSeries<ChartData, String>(
                dataSource: context.watch<ChartProvider>().chartData,
                xValueMapper: (ChartData data, _) => data.name,
                yValueMapper: (ChartData data, _) =>
                    getDateToMillieseconds(data.date),
                color: Colors.indigo.shade400,
                dataLabelSettings: DataLabelSettings(
                    isVisible: true,
                    color: Colors.orange.shade300,
                    textStyle: const TextStyle(fontSize: 12)),
                markerSettings:
                    const MarkerSettings(isVisible: true, color: Colors.orange),
              ),
            ],
          )
        : const Spinner();
  }
}
