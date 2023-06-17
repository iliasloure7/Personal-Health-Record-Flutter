import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignment1/screens/Splash/splash_screen.dart';
import 'package:assignment1/providers/AlleryProvider/allergy_provider.dart';
import 'package:assignment1/providers/ImmunizationProvider/immunization_provider.dart';
import 'package:assignment1/providers/MedicationProvider/medication_provider.dart';
import 'package:assignment1/providers/ProblemListProvider/problem_list_provider.dart';
import 'package:assignment1/providers/ProcedureProvider/procedure_provider.dart';
import 'package:assignment1/providers/DemographicProvider/demographic_provider.dart';
import 'package:assignment1/providers/CareProvider/care_provider.dart';
import 'package:assignment1/providers/GuardianProvider/guardian_provider.dart';
import 'package:assignment1/providers/ChartProvider/chart_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AllergyProvider()),
        ChangeNotifierProvider(create: (_) => ImmunizationProvider()),
        ChangeNotifierProvider(create: (_) => MedicationProvider()),
        ChangeNotifierProvider(create: (_) => ProblemListProvider()),
        ChangeNotifierProvider(create: (_) => ProcedureProvider()),
        ChangeNotifierProvider(create: (_) => CareProvider()),
        ChangeNotifierProvider(create: (_) => DemographicProvider()),
        ChangeNotifierProvider(create: (_) => GuardianProvider()),
        ChangeNotifierProvider(create: (_) => ChartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        // Aρχικοποίηση εφαρμογής με splash screen
        home: const SplashScreen());
  }
}
