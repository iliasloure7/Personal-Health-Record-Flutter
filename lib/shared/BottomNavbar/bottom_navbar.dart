import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavbar extends StatefulWidget {
  final int selectedIndex;
  final String title;
  final String currentScreen;
  final IconData icon;
  final Function(int) navigateBottomBar;

  const BottomNavbar({
    super.key,
    required this.selectedIndex,
    required this.title,
    required this.icon,
    required this.navigateBottomBar,
    this.currentScreen = '',
  });

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  List<BottomNavigationBarItem> _items = [];

  void _initItemsWithAllTabs() {
    _items = [
      BottomNavigationBarItem(icon: Icon(widget.icon), label: widget.title),
      const BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.chartArea), label: 'Chart'),
      const BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.wpforms), label: 'Form'),
    ];
  }

  void _initItemsWithDetailsAndChartTabs() {
    _items = [
      BottomNavigationBarItem(icon: Icon(widget.icon), label: widget.title),
      const BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.chartArea), label: 'Chart'),
    ];
  }

  void _initItemsWithDetailsAndFormTabs() {
    _items = [
      BottomNavigationBarItem(icon: Icon(widget.icon), label: widget.title),
      const BottomNavigationBarItem(
          icon: Icon(FontAwesomeIcons.wpforms), label: 'Form'),
    ];
  }

  @override
  void initState() {
    super.initState();

    if (widget.currentScreen == '') {
      _initItemsWithAllTabs();
    } else if (widget.currentScreen == 'allergy') {
      _initItemsWithDetailsAndFormTabs();
    } else {
      _initItemsWithDetailsAndChartTabs();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
        onTap: widget.navigateBottomBar,
        currentIndex: widget.selectedIndex,
        selectedItemColor: Colors.amber[800],
        items: _items);
  }
}
