import 'package:flutter/material.dart';

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
      home: HomePages(),
    );
  }
}

class HomePages extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePages> {
  int multiplier = 1;
  List<String> selectedActivities = [];
  int selectedActivitiesPrice = 0;

  // Liste centralisée des activités
  final List<Activity> activities = [
    Activity(name: 'Paintball', price: 25, color: Colors.lightGreen),
    Activity(name: 'Tir sur Cible', price: 10, color: Colors.lightBlueAccent),
    Activity(name: 'Lancer de Hache', price: 10, color: Colors.grey),
    Activity(name: 'Lancer de Couteau', price: 10, color: Colors.yellow),
    Activity(name: 'Tir à l\'arc Enfants', price: 15, color: Colors.pinkAccent),
    Activity(name: 'Tir à l\'arc Adultes', price: 20, color: Colors.pinkAccent),
    Activity(name: 'Arc Attaque Enfants', price: 15, color: Colors.deepOrange),
    Activity(name: 'Arc Attaque Adultes', price: 20, color: Colors.deepOrange),
  ];

  // Liste des boutons numériques
  final List<String> numericButtons = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'C'];

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
            // Grille des activités
            Expanded(child: buildActivityGrid()),
            SizedBox(height: 20),
            // Grille des boutons numériques
            buildNumericGrid(),
          ],
        ),
      ),
    );
  }

  Widget buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            child: Text(
              'Commande',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          // Liste des activités sélectionnées avec une croix pour les supprimer
          ...selectedActivities.asMap().entries.map((entry) {
            int index = entry.key;
            String activity = entry.value;
            return ListTile(
              title: Text(activity),
              trailing: IconButton(
                icon: Icon(Icons.close, color: Colors.red),
                onPressed: () {
                  setState(() {
                    // Supprimer l'activité sélectionnée et mettre à jour le prix total
                    selectedActivitiesPrice -= calculatePrice(selectedActivities[index]);
                    selectedActivities.removeAt(index);
                  });
                },
              ),
            );
          }).toList(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('Montant Total : ${selectedActivitiesPrice}€'),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selectedActivities.clear();
                  selectedActivitiesPrice = 0;
                });
              },
              child: Text('Annuler la commande'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
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
            setState(() {
              selectedActivities.add('$multiplier x ${activity.name} ${activity.price}€');
              selectedActivitiesPrice += multiplier * activity.price;
              multiplier = 1; // Réinitialiser le multiplicateur
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: activity.color,
            foregroundColor: Colors.black,
            side: BorderSide(color: Colors.black, width: 1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(activity.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              SizedBox(height: 5),
              Text('${activity.price}€', style: TextStyle(fontSize: 14, color: Colors.black)),
            ],
          ),
        );
      },
    );
  }

  Widget buildNumericGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3,
      ),
      itemCount: numericButtons.length,
      itemBuilder: (context, index) {
        return ElevatedButton(
          onPressed: () {
            setState(() {
              if (numericButtons[index] == 'C') {
                selectedActivities.clear();
                selectedActivitiesPrice = 0;
                multiplier = 1;
              } else {
                multiplier = int.tryParse(numericButtons[index]) ?? 1;
              }
            });
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.grey,
            foregroundColor: Colors.black,
            side: BorderSide(color: Colors.black, width: 1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          ),
          child: Text(numericButtons[index], style: TextStyle(fontSize: 18)),
        );
      },
    );
  }


  int calculatePrice(String activity){
    final parts = activity.split(' ');
    for (var i = 0; i < parts.length; i++){
      parts[i] = parts[i].replaceAll("€", "");
    }
    int priceToDeduce = int.parse(parts[parts.length-1]) * int.parse(parts[0]);
    return priceToDeduce;
  }
}

// Modèle pour une activité
class Activity {
  final String name;
  final int price;
  final Color color;

  Activity({required this.name, required this.price, required this.color});
}
