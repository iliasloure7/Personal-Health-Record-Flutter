import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assignment1/utils/constants.dart';
import 'package:assignment1/models/procedure_model.dart';

class ProcedureProvider with ChangeNotifier {
  List<ProcedureData> _data = [];

  List<ProcedureData> get data => _data;

  Future<List<ProcedureData>> fetchProcedures() async {
    final String response = await rootBundle.loadString(procedureDataURL);
    final List<dynamic> jsonData = await json.decode(response)['procedures'];

    _data = jsonData.map((item) => ProcedureData.fromJson(item)).toList();

    notifyListeners();

    return _data;
  }

  void setProcedure(ProcedureData data) {
    _data.add(data);
    notifyListeners();
  }
}
