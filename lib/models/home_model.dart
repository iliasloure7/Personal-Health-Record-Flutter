import 'package:flutter/material.dart';
import 'package:assignment1/screens/Care/care_screen.dart';
import 'package:assignment1/screens/Guardian/guardian_screen.dart';
import 'package:assignment1/screens/Allergy/allergy_screen.dart';
import 'package:assignment1/screens/Immunization/immunization_screen.dart';
import 'package:assignment1/screens/Medication/medication_screen.dart';
import 'package:assignment1/screens/ProblemList/problem_list_screen.dart';
import 'package:assignment1/screens/Procedure/procedure_screen.dart';
import 'package:assignment1/screens/Demographic/demographic_screen.dart';

final List<HomeData> items = [
  HomeData(
      title: 'Allergies',
      imagePath: 'assets/images/allergy.png',
      navigateTo: const AllergyScreen()),
  HomeData(
      title: 'Immunizations',
      imagePath: 'assets/images/vaccine.png',
      navigateTo: const ImmunizationScreen()),
  HomeData(
      title: 'Medications',
      imagePath: 'assets/images/medicine.png',
      navigateTo: const MedicationScreen()),
  HomeData(
      title: 'Problem List',
      imagePath: 'assets/images/list.png',
      navigateTo: const ProblemListScreen()),
  HomeData(
      title: 'Procedures',
      imagePath: 'assets/images/surgery.png',
      navigateTo: const ProcedureScreen()),
  HomeData(
      title: 'Demographics',
      imagePath: 'assets/images/profile.png',
      navigateTo: const DemographicScreen()),
  HomeData(
      title: 'Care',
      imagePath: 'assets/images/healthcare.png',
      navigateTo: const CareScreen()),
  HomeData(
      title: 'Guardians',
      imagePath: 'assets/images/family.png',
      navigateTo: const GuardianScreen()),
];

class HomeData {
  String title;
  String imagePath;
  Widget navigateTo;

  HomeData(
      {required this.title, required this.imagePath, required this.navigateTo});
}
