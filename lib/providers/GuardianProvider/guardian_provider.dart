import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:assignment1/models/guardian_model.dart';
import 'package:assignment1/utils/constants.dart';

class GuardianProvider with ChangeNotifier {
  List<GuardianData> _data = [];

  List<GuardianData> get data => _data;

  Future<void> fetchGuardians() async {
    final String response = await rootBundle.loadString(guardianDataURL);
    final List<dynamic> jsonData = await json.decode(response)['guardians'];

    _data = jsonData.map((item) => GuardianData.fromJson(item)).toList();

    notifyListeners();
  }
}
