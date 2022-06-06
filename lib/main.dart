import 'package:bpi_examen/bloc/adherents/adherents_bloc.dart';
import 'package:bpi_examen/bloc/livres/livres_bloc.dart';
import 'package:bpi_examen/firebase_options.dart';
import 'package:bpi_examen/ui/pages/about.page.dart';
import 'package:bpi_examen/ui/pages/adherents.page.dart';
import 'package:bpi_examen/ui/pages/home.page.dart';
import 'package:bpi_examen/ui/pages/livres.page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => LivresBloc()),
          BlocProvider(create: (context) => AdherentsBloc())
        ], 
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          routes: {
            '/home': (context) => HomePage(),
            '/livres': (context) => LivresPage(),
            '/adherents': (context) => AdherentsPage(),
            '/about':(context) => AboutPage(),
          },
          initialRoute: '/home',
        )
    );
  }
}
