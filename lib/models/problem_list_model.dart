import 'package:assignment1/models/chart_model.dart';

class ProblemListData extends ChartData {
  final String status;
  final String comments;

  ProblemListData(
      {required super.name,
      required super.date,
      required this.status,
      required this.comments});

  factory ProblemListData.fromJson(Map<String, dynamic> json) {
    return ProblemListData(
      name: json['name'],
      date: json['date'],
      status: json['status'],
      comments: json['comments'],
    );
  }
}
