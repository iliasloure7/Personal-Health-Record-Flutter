import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assignment1/models/allergy_model.dart';
import 'package:assignment1/utils/constants.dart';

class AllergyProvider with ChangeNotifier {
  List<AllergyData> _data = [];

  List<AllergyData> get data => _data;

  Future<void> fetchAllergies() async {
    final String response = await rootBundle.loadString(allergyDataURL);
    final List<dynamic> jsonData = await json.decode(response)['allergies'];

    _data = jsonData.map((item) => AllergyData.fromJson(item)).toList();

    notifyListeners();
  }

  void setAllergy(AllergyData data) {
    _data.add(data);
    notifyListeners();
  }
}
