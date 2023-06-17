import 'package:assignment1/models/chart_model.dart';

class CareData extends ChartData {
  final String instructions;

  CareData(
      {required super.name, required super.date, required this.instructions});

  factory CareData.fromJson(Map<String, dynamic> json) {
    return CareData(
        name: json['name'],
        date: json['date'],
        instructions: json['instructions']);
  }
}
