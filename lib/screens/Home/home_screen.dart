import 'package:flutter/material.dart';
import 'package:assignment1/screens/Home/widgets/HomeCardContainer/home_card_container.dart';
import 'package:assignment1/shared/Drawer/MainDrawer/main_drawer.dart';
import 'package:assignment1/shared/TopBar/top_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const TopBar(userName: 'Michail', prevScreen: 'home'),
        toolbarHeight: 80,
      ),
      backgroundColor: Colors.grey.shade100,
      body: const HomeCardContainer(),
    );
  }
}
