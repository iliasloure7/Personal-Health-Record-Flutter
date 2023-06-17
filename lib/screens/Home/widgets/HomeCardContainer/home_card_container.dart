import 'package:flutter/material.dart';
import 'package:assignment1/models/home_model.dart';
import 'package:assignment1/screens/Home/widgets/HomeCard/home_card.dart';

class HomeCardContainer extends StatelessWidget {
  const HomeCardContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Our Health,\nServices',
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.grey.shade900),
          ),
          const SizedBox(height: 10),
          Expanded(
            // Δημιουργεί την λίστα με τις κάρτες κάθε κατηγορίας
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: items.length,
                itemBuilder: (context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => items[index].navigateTo));
                    },
                    child: HomeCard(
                      title: items[index].title,
                      imagePath: items[index].imagePath,
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
