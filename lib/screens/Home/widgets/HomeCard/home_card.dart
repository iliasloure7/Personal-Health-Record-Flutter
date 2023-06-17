import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const HomeCard({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      color: Colors.indigo.shade100,
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(height: 16),
        Image.asset(imagePath, width: 60),
        const SizedBox(height: 16),
        Expanded(
            child: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
              borderRadius:  BorderRadius.only(
                  bottomLeft: Radius.circular(6),
                  bottomRight: Radius.circular(6)),
              color: Colors.white),
          child: Center(
            child: Text(title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
          ),
        )),
      ]),
    );
  }
}
