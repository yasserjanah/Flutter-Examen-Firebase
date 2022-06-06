// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  String route;
  String title;
  IconData icon;

  DrawerItem(this.title, this.route, this.icon, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      child: ListTile(
        style: ListTileStyle.drawer,
        onTap: () {
          Navigator.pushNamed(context, route);
        },
        leading: CircleAvatar(
          backgroundColor: Colors.red,
          child: CircleAvatar(
            child: Icon(icon, color: Colors.white),
          ),
        ),
        title: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}