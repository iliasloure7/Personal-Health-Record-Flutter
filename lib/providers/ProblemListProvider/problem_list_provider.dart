import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assignment1/models/problem_list_model.dart';
import 'package:assignment1/utils/constants.dart';

class ProblemListProvider with ChangeNotifier {
  List<ProblemListData> _data = [];

  List<ProblemListData> get data => _data;

  Future<List<ProblemListData>> fetchProblemList() async {
    final String response = await rootBundle.loadString(problemListDataURL);
    final List<dynamic> jsonData = await json.decode(response)['problem_list'];

    _data = jsonData.map((item) => ProblemListData.fromJson(item)).toList();

    notifyListeners();

    return _data;
  }

  void setProblemData(ProblemListData data) {
    _data.add(data);
    notifyListeners();
  }
}
