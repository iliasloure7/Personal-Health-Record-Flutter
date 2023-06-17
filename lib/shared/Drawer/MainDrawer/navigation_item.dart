import 'package:assignment1/screens/Allergy/allergy_screen.dart';
import 'package:assignment1/screens/Care/care_screen.dart';
import 'package:assignment1/screens/Demographic/demographic_screen.dart';
import 'package:assignment1/screens/Guardian/guardian_screen.dart';
import 'package:assignment1/screens/Home/home_screen.dart';
import 'package:assignment1/screens/Immunization/immunization_screen.dart';
import 'package:assignment1/screens/Medication/medication_screen.dart';
import 'package:assignment1/screens/ProblemList/problem_list_screen.dart';
import 'package:assignment1/screens/Procedure/procedure_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final List<NavigationItem> items = [
  NavigationItem(
      title: 'Home',
      icon: const FaIcon(FontAwesomeIcons.house),
      navigateTo: const HomeScreen()),
  NavigationItem(
      title: 'Allergies',
      icon: const FaIcon(FontAwesomeIcons.personDotsFromLine),
      navigateTo: const AllergyScreen()),
  NavigationItem(
      title: 'Immunizations',
      icon: const FaIcon(FontAwesomeIcons.syringe),
      navigateTo: const ImmunizationScreen()),
  NavigationItem(
      title: 'Medications',
      icon: const FaIcon(FontAwesomeIcons.notesMedical),
      navigateTo: const MedicationScreen()),
  NavigationItem(
      title: 'Problem List',
      icon: const FaIcon(FontAwesomeIcons.clipboardList),
      navigateTo: const ProblemListScreen()),
  NavigationItem(
      title: 'Procedures',
      icon: const FaIcon(FontAwesomeIcons.bedPulse),
      navigateTo: const ProcedureScreen()),
  NavigationItem(
      title: 'Demographics',
      icon: const FaIcon(FontAwesomeIcons.idCard),
      navigateTo: const DemographicScreen()),
  NavigationItem(
      title: 'Plan Of Care',
      icon: const FaIcon(FontAwesomeIcons.handHoldingHeart),
      navigateTo: const CareScreen()),
  NavigationItem(
      title: 'Guardians',
      icon: const FaIcon(FontAwesomeIcons.peopleGroup),
      navigateTo: const GuardianScreen()),
];

class NavigationItem {
  String title;
  FaIcon icon;
  Widget navigateTo;

  NavigationItem(
      {required this.title, required this.icon, required this.navigateTo});
}
