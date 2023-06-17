import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:assignment1/providers/GuardianProvider/guardian_provider.dart';
import 'package:assignment1/screens/Guardian/widgets/GuardianDetails/guardian_details.dart';
import 'package:assignment1/shared/Drawer/MainDrawer/main_drawer.dart';
import 'package:assignment1/shared/TopBar/top_bar.dart';

class GuardianScreen extends StatefulWidget {
  const GuardianScreen({super.key});

  @override
  State<GuardianScreen> createState() => _GuardianScreenState();
}

class _GuardianScreenState extends State<GuardianScreen> {

  @override
  void initState() {
    context.read<GuardianProvider>().fetchGuardians();
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
      // Δημιουργία καρτών για κάθε κηδεμόνα του χρήστη
      body: const GuardianDetails(),
    );
  }
}
