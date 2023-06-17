import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:assignment1/providers/ChartProvider/chart_provider.dart';
import 'package:assignment1/providers/ProblemListProvider/problem_list_provider.dart';
import 'package:assignment1/screens/ProblemList/widgets/ProblemListDetails/problem_list_details.dart';
import 'package:assignment1/screens/ProblemList/widgets/ProblemListForm/problem_list_form.dart';
import 'package:assignment1/shared/BottomNavbar/bottom_navbar.dart';
import 'package:assignment1/shared/Chart/chart.dart';
import 'package:assignment1/shared/Drawer/MainDrawer/main_drawer.dart';
import 'package:assignment1/shared/TopBar/top_bar.dart';

class ProblemListScreen extends StatefulWidget {
  const ProblemListScreen({super.key});

  @override
  State<ProblemListScreen> createState() => _ProblemListScreenState();
}

class _ProblemListScreenState extends State<ProblemListScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const ProblemListDetails(),
    const Chart(title: 'Problem List'),
    const ProblemListForm(),
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
    if (context.read<ProblemListProvider>().data.isNotEmpty) {
      if (context.read<ProblemListProvider>().data.isNotEmpty) {
        context
            .read<ChartProvider>()
            .setChartDataList(context.read<ProblemListProvider>().data);
        return;
      }
    }

    context.read<ProblemListProvider>().fetchProblemList().then((data) {
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
      // Δημιουργία καρτών για κάθε πρόβλημα του χρήστη
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavbar(
          selectedIndex: _selectedIndex,
          title: 'Problem List',
          icon: FontAwesomeIcons.clipboardList,
          navigateBottomBar: navigateBottomBar),
    );
  }
}
