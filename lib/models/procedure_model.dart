import 'package:assignment1/models/chart_model.dart';

class ProcedureData extends ChartData {
  final String provider;
  final String location;

  ProcedureData(
      {required super.name,
      required super.date,
      required this.provider,
      required this.location});

  factory ProcedureData.fromJson(Map<String, dynamic> json) {
    return ProcedureData(
      name: json['name'],
      date: json['date'],
      provider: json['provider'],
      location: json['location'],
    );
  }
}
