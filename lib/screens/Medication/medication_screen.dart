import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:assignment1/providers/ChartProvider/chart_provider.dart';
import 'package:assignment1/providers/MedicationProvider/medication_provider.dart';
import 'package:assignment1/screens/Medication/widgets/MedicationForm/medication_form.dart';
import 'package:assignment1/screens/Medication/widgets/MedicationDetails/medication_details.dart';
import 'package:assignment1/shared/Chart/chart.dart';
import 'package:assignment1/shared/Drawer/MainDrawer/main_drawer.dart';
import 'package:assignment1/shared/BottomNavbar/bottom_navbar.dart';
import 'package:assignment1/shared/TopBar/top_bar.dart';

class MedicationScreen extends StatefulWidget {
  const MedicationScreen({super.key});

  @override
  State<MedicationScreen> createState() => _MedicationScreenState();
}

class _MedicationScreenState extends State<MedicationScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const MedicationDetails(),
    const Chart(title: 'Medications'),
    const MedicationForm(),
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
    if (context.read<MedicationProvider>().data.isNotEmpty) {
      context
          .read<ChartProvider>()
          .setChartDataList(context.read<MedicationProvider>().data);
      return;
    }

    context.read<MedicationProvider>().fetchMedications().then((data) {
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
      // Δημιουργία καρτών για κάθε φαρμακευτική αγωγή του χρήστη
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavbar(
        selectedIndex: _selectedIndex,
        title: 'Medications',
        icon: FontAwesomeIcons.notesMedical,
        navigateBottomBar: navigateBottomBar,
      ),
    );
  }
}
