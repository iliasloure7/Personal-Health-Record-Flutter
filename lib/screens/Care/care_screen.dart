import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:assignment1/providers/CareProvider/care_provider.dart';
import 'package:assignment1/providers/ChartProvider/chart_provider.dart';
import 'package:assignment1/screens/Care/widgets/CareDetails/care_details.dart';
import 'package:assignment1/shared/BottomNavbar/bottom_navbar.dart';
import 'package:assignment1/shared/Chart/chart.dart';
import 'package:assignment1/shared/Drawer/MainDrawer/main_drawer.dart';
import 'package:assignment1/shared/TopBar/top_bar.dart';

class CareScreen extends StatefulWidget {
  const CareScreen({super.key});

  @override
  State<CareScreen> createState() => _CareScreenState();
}

class _CareScreenState extends State<CareScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const CareDetails(),
    const Chart(title: 'Plan Of Care'),
  ];

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    context.read<CareProvider>().fetchCare().then((data) {
      context.read<ChartProvider>().setChartDataList(data);
    });
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
      // Δημιουργία καρτών για κάθε πλάνο φροντίδας.
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavbar(
          selectedIndex: _selectedIndex,
          title: 'Care',
          icon: FontAwesomeIcons.handHoldingHeart,
          navigateBottomBar: navigateBottomBar,
          currentScreen: 'care'),
    );
  }
}
