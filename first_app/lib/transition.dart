import 'package:flutter/material.dart';
import 'package:first_app/exportation.dart';


void main() {
  runApp(MyApp());
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
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Page Principale'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/arc_attaque');
              },
              child: Text('Arc Attaque'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/bar');
              },
              child: Text('Bar'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/boutique');
              },
              child: Text('Boutique'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/lancer');
              },
              child: Text('Lancer'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/paintball');
              },
              child: Text('Paintball'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/sarbacane');
              },
              child: Text('Sarbacane'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/tir_arc');
              },
              child: Text('Tir à l\'arc'),
            ),
          ],
        ),
      ),
    );
  }
}





