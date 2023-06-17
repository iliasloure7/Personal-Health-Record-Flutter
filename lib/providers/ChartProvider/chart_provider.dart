import 'package:flutter/material.dart';
import 'package:assignment1/models/chart_model.dart';

class ChartProvider with ChangeNotifier {
  List<ChartData> _chartData = [];

  List<ChartData> get chartData => _chartData;

  setChartDataList(List<dynamic> data) {
    _chartData = data
        .map((item) => ChartData(name: item.name, date: item.date))
        .toList();
  }

  setChartData(ChartData data) {
    _chartData.add(data);
    notifyListeners();
  }

  clearChartDataList() {
    _chartData = [];
    notifyListeners();
  }
}
