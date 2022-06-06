
import 'package:bpi_examen/ui/widgets/drawer.widget.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // navigation drawer
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('About'),
      ),
      body: Center(
          heightFactor: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: const [
                Icon(
                  Icons.error_outline_rounded,
                  color: Colors.red,
                  size: 150,
                ),
                Text(
                  'BPI EXAMEN',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'by Yassir JANAH',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.redAccent
                    ),
                  ),
                ),
                Text(
                  'Version 1.0.0',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Copyright © 2020',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )
        )
      );
  }
}