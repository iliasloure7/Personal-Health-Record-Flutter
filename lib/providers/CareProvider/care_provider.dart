import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assignment1/models/care_model.dart';
import 'package:assignment1/utils/constants.dart';

class CareProvider with ChangeNotifier {
  List<CareData> _data = [];

  List<CareData> get data => _data;

  Future<List<CareData>> fetchCare() async {
    final String response = await rootBundle.loadString(careDataURL);
    final List<dynamic> jsonData = await json.decode(response)['care'];

    _data = jsonData.map((item) => CareData.fromJson(item)).toList();

    notifyListeners();

    return _data;
  }
}
