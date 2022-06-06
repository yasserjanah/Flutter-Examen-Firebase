// home page body

// ignore_for_file: unused_import

import 'package:bpi_examen/bloc/livres/livres_bloc.dart';
import 'package:bpi_examen/ui/widgets/drawer.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // navigation drawer
      drawer: AppDrawer(),
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
          heightFactor: 2,
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: const [
                // image widget
                Center(
                child: Image(
                  image: AssetImage('assets/images/logo.jpg'),
                  height: 200,
                  width: 200,
                ),
                ),
                Text("Welcome to Bibliothèque Public",
                    style: TextStyle(color: Colors.grey, fontSize: 26))
              ],
            ),
          )
        )
      );
  }
}