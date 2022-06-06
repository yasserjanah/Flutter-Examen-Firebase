// ignore_for_file: sort_child_properties_last

import 'package:bpi_examen/ui/widgets/drawer_item.widget.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {

  String currentRoute="Home";

  setCurrentRoute(String route){
    setState(() {
      currentRoute=route;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.red,
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              children: const [
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 60,
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/images/logo.jpg"),
                    ),
                  ),
                ),
                Text("Bibliothèque public",
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Colors.white,
                        fontSize: 25)),
              ],
            ),
            padding: const EdgeInsets.only(bottom: 10),
            margin: const EdgeInsets.only(top: 20),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 20, left: 0, right: 8, bottom: 10),
            child: Column(
              children: [
                DrawerItem("Home", "/home", Icons.home),
                DrawerItem("Livres", "/livres", Icons.book),
                DrawerItem("Adhérents", "/adherents", Icons.account_box),
                DrawerItem("About", "/about", Icons.error_outline_rounded),
              ],
            ),
          ),
        ],
      ),
    );
  }
}