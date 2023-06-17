import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignment1/providers/DemographicProvider/demographic_provider.dart';
import 'package:assignment1/screens/Demographic/widgets/DemographicDetails/demographic_details.dart';
import 'package:assignment1/shared/TopBar/top_bar.dart';
import 'package:assignment1/shared/Drawer/MainDrawer/main_drawer.dart';

class DemographicScreen extends StatefulWidget {
  const DemographicScreen({super.key});

  @override
  State<DemographicScreen> createState() => _DemographicScreenState();
}

class _DemographicScreenState extends State<DemographicScreen> {
  @override
  void initState() {
    context.read<DemographicProvider>().fetchDemographics();
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
        // Δημιουργία καρτών για κάθε πληροφορία του χρήστη
        body: const DemographicDetails());
  }
}
