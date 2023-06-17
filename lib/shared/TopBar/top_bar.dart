import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  final String userName;
  final String prevScreen;

  const TopBar({super.key, required this.userName, this.prevScreen = ''});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ο έλεγχος αυτός χρησιμοποιείται, ώστε να μην εμφανίζει το "Welcome" σε όλα τα screens.
            // Θέλω να εμφανίζεται μόνο στην αρχική σελίδα.
            if (prevScreen == 'home') ...[
                   Text(
                'Welcome',
                style: TextStyle(fontSize: 15, color: Colors.grey.shade300),
                overflow: TextOverflow.ellipsis,
              ),
            ],
            Text(
              userName,
              style: const TextStyle(
                fontSize: 21,
                fontWeight: FontWeight.bold,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
        const SizedBox(width: 10),
        const CircleAvatar(
          backgroundImage: AssetImage('assets/images/profile.jpg'),
          radius: 25,
        ),
      ],
    );
  }
}
