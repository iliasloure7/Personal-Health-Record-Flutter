import 'package:assignment1/models/chart_model.dart';
import 'package:assignment1/providers/ChartProvider/chart_provider.dart';
import 'package:assignment1/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

int getDateToMillieseconds(String date) {
  List<String> dateArr = date.split(',');

  String monthInStringFormat = dateArr[0].split(' ')[0];

  int year = int.parse(dateArr[1]);
  int month = months.indexOf(monthInStringFormat) + 1;
  int day = int.parse(dateArr[0].split(' ')[1]);

  return DateTime(year, month, day).millisecondsSinceEpoch;
}

String getDateFromMilliSeconds(int millieseconds) {
  String year =
      DateTime.fromMillisecondsSinceEpoch(millieseconds).year.toString();

  String month =
      DateTime.fromMillisecondsSinceEpoch(millieseconds).month.toString();

  String day =
      DateTime.fromMillisecondsSinceEpoch(millieseconds).day.toString();

  return '$year/$month/$day';
}

void showDatePickerDialog(
    BuildContext context, TextEditingController controller) async {
  DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025));

  if (dateTime == null) return;
  _showDateTimeValue(dateTime, controller);
}

// Εμφανίζει στο πεδιό ημερομηνίας την τιμή που επέλεξε ο χρήστης.
void _showDateTimeValue(DateTime dateTime, TextEditingController controller) {
  // Παίρνουμε μόνο την ημερομηνία και όχι την ώρα.
  String dateTimeString = dateTime.toString().split(' ')[0];
  controller.text = dateTimeString;
}

String? textFormFieldValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required...';
  }

  return null;
}

String? dateFormFieldValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'This field is required...';
  }

  if (!_isValidDateTimeFormat(value)) {
    return 'This format is not valid...';
  }

  return null;
}

// Ελέγχει έαν η ημερομηνία είναι της μορφής year-month-day.
bool _isValidDateTimeFormat(String dateTime) {
  try {
    DateTime.parse(dateTime);
    return true;
  } catch (e) {
    return false;
  }
}

// Μετατρέπει την ημερομηνία από το πεδίο που επελέξε ο χρήστης σε συμβατή μορφή.
// πχ η ημερομηνία στα δεδομένα μας είναι της μορφής monthName day, year (September 28, 2002)
// Απο το πεδίο της ημερομηνίας παίρνουμε μια μορφή year-month-day (2002-06-05)
String getTransformedDateToValidChartFormat(String dateTime) {
  List<String> dateArr = dateTime.split('-');

  String year = dateArr[0];
  String month = dateArr[1];
  String day = dateArr[2];

  int monthToInt;
  if (int.parse(month) < 10) month = month.substring(1, month.length);
  monthToInt = int.parse(month);
  
  return '${months[monthToInt - 1]} $day, $year';
}

void setNewChartData(BuildContext context, name, date) =>
    context.read<ChartProvider>().setChartData(ChartData(
        name: name, date: getTransformedDateToValidChartFormat(date)));
