import 'dart:async';
import 'package:flutter/material.dart';
import 'package:assignment1/screens/Home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Μετά απο 3 δευτερόλεπτα γίνεται μεταφορά στην αρχική σελίδα
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash Screen'),
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: Center(
          child: Image.asset('assets/images/heart.png', width: 60),
        ),
      ),
    );
  }
}
