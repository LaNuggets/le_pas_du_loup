import 'package:flutter/material.dart';

class NumericGrid extends StatelessWidget {
  final List<String> numericButtons;
  final Function(String) onButtonPressed;

  NumericGrid({
    required this.numericButtons,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
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
          onPressed: () => onButtonPressed(numericButtons[index]),
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
}

class Numeric extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: buildNumericGrid(),
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
}

class Burger extends StatefulWidget {
  final int initialSelectedActivitiesPrice;
  final List<String> initialSelectedActivities;

  Burger({
    required this.initialSelectedActivitiesPrice,
    required this.initialSelectedActivities,
  });

  @override
  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  late int selectedActivitiesPrice;
  late List<String> selectedActivities;

  @override
  void initState() {
    super.initState();
    // Initialiser les variables avec les valeurs passées par le widget parent
    selectedActivitiesPrice = widget.initialSelectedActivitiesPrice;
    selectedActivities = List<String>.from(widget.initialSelectedActivities);
  }

  @override
  Widget build(BuildContext context) {
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

  int calculatePrice(String activity) {
    final parts = activity.split(' ');
    for (var i = 0; i < parts.length; i++) {
      parts[i] = parts[i].replaceAll("€", "");
    }
    int priceToDeduce = int.parse(parts[parts.length - 1]) * int.parse(parts[0]);
    return priceToDeduce;
  }
}


class PriceButtonModel {
  final String name;
  final Color color;
  final double price;

  PriceButtonModel({required this.name, required this.color, required this.price});
}

class PriceButtonGrid extends StatelessWidget {
  final List<PriceButtonModel> priceButtons;

  PriceButtonGrid({required this.priceButtons});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.7,
      ),
      itemCount: priceButtons.length,
      itemBuilder: (context, index) {
        final activity = priceButtons[index];
        return ElevatedButton(
          onPressed: () {
            print('Activity selected: ${activity.name}');
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
}