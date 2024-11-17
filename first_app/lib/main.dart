import 'package:flutter/material.dart';
import 'package:first_app/exportation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => OrderState(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/arc_attaque': (context) => Arc_attaque(),
        '/bar': (context) => Bar(),
        '/boutique': (context) => Boutique(),
        '/lancer': (context) => Lancer(),
        '/paintball': (context) => Paintball(),
        '/sarbacane': (context) => Sarbacane(),
        '/tir_arc': (context) => Tir_arc(),
        '/paiments': (context) => Paiments(),
      },
    );
  }
}


