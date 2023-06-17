import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assignment1/models/demographic_model.dart';
import 'package:assignment1/utils/constants.dart';

class DemographicProvider with ChangeNotifier {
  List<DemographicData> _data = [];

  List<DemographicData> get data => _data;

  Future<void> fetchDemographics() async {
    final String response = await rootBundle.loadString(demographicDataURL);
    final List<dynamic> jsonData = await json.decode(response)['demographic'];

    _data = jsonData.map((item) => DemographicData.fromJson(item)).toList();

    notifyListeners();
  }
}
