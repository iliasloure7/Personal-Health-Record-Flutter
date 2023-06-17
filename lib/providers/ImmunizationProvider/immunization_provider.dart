import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assignment1/models/immunization_model.dart';
import 'package:assignment1/utils/constants.dart';

class ImmunizationProvider with ChangeNotifier {
  List<ImmunizationData> _data = [];

  List<ImmunizationData> get data => _data;

  Future<void> fetchImmunizations() async {
    final String response = await rootBundle.loadString(immunizationDataURL);
    final List<dynamic> jsonData = await json.decode(response)['immunizations'];

    _data = jsonData.map((item) => ImmunizationData.fromJson(item)).toList();

    notifyListeners();
  }
}
