import 'package:assignment1/models/chart_model.dart';

class MedicationData extends ChartData {
  final int dose;
  final int rate;
  final String instructions;
  final String prescriber;

  MedicationData(
      {required super.name,
      required super.date,
      required this.dose,
      required this.rate,
      required this.instructions,
      required this.prescriber,
    });

  factory MedicationData.fromJson(Map<String, dynamic> json) {
    return MedicationData(
        name: json['name'],
        date: json['date'],
        dose: json['dose'],
        rate: json['rate'],
        instructions: json['instructions'],
        prescriber: json['prescriber']);
  }
}
