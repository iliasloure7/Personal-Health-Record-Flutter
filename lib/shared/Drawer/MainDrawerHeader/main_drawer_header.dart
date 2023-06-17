import 'package:flutter/material.dart';

class MainDrawerHeader extends StatelessWidget {
  const MainDrawerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                // Δημιουργία εικόνας του χρήστη
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                  radius: 50,
                ),
                SizedBox(height: 5),
                Text('Michail',
                    style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
