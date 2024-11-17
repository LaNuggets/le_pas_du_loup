import 'package:flutter/material.dart';
import 'package:first_app/exportation.dart';
import 'package:first_app/exportation.dart';

class Activity {
  final String name;
  final Color color;
  final String link;

  Activity({required this.name, required this.color, required this.link});
}

class HomePage extends StatelessWidget {
  final List<Activity> activities = [
    Activity(name: 'Paintball', color: Colors.lightGreen, link: '/paintball'),
    Activity(name: 'Arc Attaque', color: Colors.deepOrange, link: '/arc_attaque'),
    Activity(name: 'Lancer', color: Colors.yellow, link: '/lancer'),
    Activity(name: 'Tir à l\'arc', color: Colors.pinkAccent, link: '/tir_arc'),
    Activity(name: 'Sarbacane', color: Colors.lightBlueAccent, link: '/sarbacane'),
    Activity(name: 'Boutique', color: Colors.red, link: '/boutique'),
    Activity(name: 'Bar', color: Colors.brown, link: '/bar'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choix de l\'activité'),
        centerTitle: true,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
      ),
      drawer: buildDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(child: buildActivityGrid()),
            SizedBox(height: 20),
            buildNumericGrid(), // Intégration de NumericGrid
          ],
        ),
      ),
    );
  }

  Widget buildActivityGrid() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.7,
      ),
      itemCount: activities.length,
      itemBuilder: (context, index) {
        final activity = activities[index];
        return ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, activity.link);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: activity.color,
            foregroundColor: Colors.black,
            side: BorderSide(color: Colors.black, width: 1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          ),
          child: Text(activity.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        );
      },
    );
  }

  Widget buildNumericGrid() {
    final List<String> numericButtons = ['1', '2', '3', '4', '5', '6', '7', '8', '9'];

    return NumericGrid(
      numericButtons: numericButtons,
      onButtonPressed: (value) {
        print('Button pressed: $value');
      },
    );
  }

  Widget buildDrawer() {
    return Burger(
      initialSelectedActivitiesPrice: 0,
      initialSelectedActivities: [],
    );
  }
}