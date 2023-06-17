import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assignment1/models/medication_model.dart';
import 'package:assignment1/utils/constants.dart';

class MedicationProvider with ChangeNotifier {
  List<MedicationData> _data = [];

  List<MedicationData> get data => _data;

  Future<List<MedicationData>> fetchMedications() async {
    final String response = await rootBundle.loadString(medicationDataURL);
    final List<dynamic> jsonData = await json.decode(response)['medications'];

    _data = jsonData.map((item) => MedicationData.fromJson(item)).toList();

    notifyListeners();

    return _data;
  }

  void setMedication(MedicationData data) {
    _data.add(data);
    notifyListeners();
  }
}
