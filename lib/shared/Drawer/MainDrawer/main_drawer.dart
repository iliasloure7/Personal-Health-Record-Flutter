import 'package:assignment1/shared/Drawer/MainDrawerHeader/main_drawer_header.dart';
import 'package:assignment1/shared/Drawer/MainDrawer/navigation_item.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 250,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 200,
            color: Colors.teal,
            child: const MainDrawerHeader(),
          ),
          Expanded(
            // Δημιουργία navigation item στο menu (home, allergies κτλ.)
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, int index) {
                NavigationItem item = items[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => item.navigateTo));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: index == items.length - 1
                            ? BorderSide.none
                            : const BorderSide(
                                color: Colors.grey,
                              ),
                      ),
                    ),
                    child: ListTile(
                      title: Text(items[index].title,
                          style: const TextStyle(fontSize: 18.0)),
                      leading: items[index].icon,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
