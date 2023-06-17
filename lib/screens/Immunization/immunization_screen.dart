import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignment1/providers/ImmunizationProvider/immunization_provider.dart';
import 'package:assignment1/screens/Immunization/widgets/ImmunizationDetails/immunization_details.dart';
import 'package:assignment1/shared/Drawer/MainDrawer/main_drawer.dart';
import 'package:assignment1/shared/TopBar/top_bar.dart';

class ImmunizationScreen extends StatefulWidget {
  const ImmunizationScreen({super.key});

  @override
  State<ImmunizationScreen> createState() => _ImmunizationScreenState();
}

class _ImmunizationScreenState extends State<ImmunizationScreen> {
  @override
  void initState() {
    context.read<ImmunizationProvider>().fetchImmunizations();
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
        // Δημιουργία καρτών για κάθε εμβολιασμό του χρήστη
        body: const ImmunizationDetails());
  }
}
