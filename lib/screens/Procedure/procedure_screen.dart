import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:assignment1/shared/TopBar/top_bar.dart';
import 'package:assignment1/shared/Drawer/MainDrawer/main_drawer.dart';
import 'package:assignment1/shared/BottomNavbar/bottom_navbar.dart';
import 'package:assignment1/screens/Procedure/widgets/ProcedureDetails/procedure_details.dart';
import 'package:assignment1/shared/Chart/chart.dart';
import 'package:assignment1/screens/Procedure/widgets/ProcedureForm/procedure_form.dart';
import 'package:assignment1/providers/ChartProvider/chart_provider.dart';
import 'package:assignment1/providers/ProcedureProvider/procedure_provider.dart';

class ProcedureScreen extends StatefulWidget {
  const ProcedureScreen({super.key});

  @override
  State<ProcedureScreen> createState() => _ProcedureScreenState();
}

class _ProcedureScreenState extends State<ProcedureScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const ProcedureDetails(),
    const Chart(title: 'Procedures'),
    const ProcedureForm(),
  ];

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // Ελέγχει εάν τα δεδομένα έχουν γίνει ήδη fetch από το τοπικό αρχείο.
    // Εφόσον έχουν γίνει δεν χρείαζεται να ξανά κάνουμε fetch.
    // Εάν ξανα κάναμε fetch σε περίπτωση που έχουμε βάλει καινούρια δεδομένα από την φόρμα, δεν θα εμφανίζονταν στην εφαρμογή.
    if (context.read<ProcedureProvider>().data.isNotEmpty) {
      context
          .read<ChartProvider>()
          .setChartDataList(context.read<ProcedureProvider>().data);
      return;
    }

    context.read<ProcedureProvider>().fetchProcedures().then((data) {
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
      // Το body εναλλάσσεται μεταξύ των πληροφοριών και του γραφήματος αναλογα με την επιλογή του χρήστη
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavbar(
          selectedIndex: _selectedIndex,
          title: 'Procedures',
          icon: FontAwesomeIcons.bedPulse,
          navigateBottomBar: navigateBottomBar),
    );
  }
}
