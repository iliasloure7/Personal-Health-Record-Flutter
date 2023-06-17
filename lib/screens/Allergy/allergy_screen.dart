import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:assignment1/providers/AlleryProvider/allergy_provider.dart';
import 'package:assignment1/screens/Allergy/widgets/AllergyForm/allergy_form.dart';
import 'package:assignment1/shared/BottomNavbar/bottom_navbar.dart';
import 'package:assignment1/shared/Drawer/MainDrawer/main_drawer.dart';
import 'package:assignment1/shared/TopBar/top_bar.dart';
import 'package:assignment1/screens/Allergy/widgets/AllergyDetails/allergy_details.dart';

class AllergyScreen extends StatefulWidget {
  const AllergyScreen({super.key});

  @override
  State<AllergyScreen> createState() => _AllergyScreenState();
}

class _AllergyScreenState extends State<AllergyScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const AllergyDetails(),
    const AllergyForm(),
  ];

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    if (context.read<AllergyProvider>().data.isNotEmpty) return;
    context.read<AllergyProvider>().fetchAllergies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TopBar(userName: 'Michail'),
        toolbarHeight: 80,
      ),
      drawer: const MainDrawer(),
      backgroundColor: Colors.grey.shade100,
      // Δημιουργία καρτών για κάθε αλλεργία του χρήστη
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavbar(
          selectedIndex: _selectedIndex,
          title: 'Allergies',
          icon: FontAwesomeIcons.personDotsFromLine,
          navigateBottomBar: navigateBottomBar,
          currentScreen: 'allergy'),
    );
  }
}
