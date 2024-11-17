import 'package:flutter/material.dart';
import 'package:first_app/pages/home.dart';

class NumericGrid extends StatelessWidget {
  final List<String> numericButtons;
  final Function(String) onButtonPressed;
  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double childAspectRatio;
  final ButtonStyle? buttonStyle;

  const NumericGrid({
    required this.numericButtons,
    required this.onButtonPressed,
    this.crossAxisCount = 3,
    this.crossAxisSpacing = 10.0,
    this.mainAxisSpacing = 10.0,
    this.childAspectRatio = 3.0,
    this.buttonStyle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: crossAxisSpacing,
        mainAxisSpacing: mainAxisSpacing,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: numericButtons.length,
      itemBuilder: (context, index) {
        return ElevatedButton(
          onPressed: () => onButtonPressed(numericButtons[index]),
          style: buttonStyle ??
              ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                foregroundColor: Colors.black,
                side: const BorderSide(color: Colors.black, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
          child: Text(
            numericButtons[index],
            style: const TextStyle(fontSize: 18),
          ),
        );
      },
    );
  }
}

class Numeric extends StatefulWidget {
  final Function(double) onMultiplierChanged;

  const Numeric({Key? key, required this.onMultiplierChanged}) : super(key: key);

  @override
  _NumericState createState() => _NumericState();
}

class _NumericState extends State<Numeric> {
  double? multiplier;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NumericGrid(
        numericButtons: List.generate(9, (index) => (index + 1).toString()),
        onButtonPressed: (value) {
          setState(() {
            multiplier = int.parse(value).toDouble();
            widget.onMultiplierChanged(multiplier!); // Notifie le parent
          });
        },
      ),
    );
  }
}


class PriceButtonModel {
  final String name;
  final Color color;
  final double price;

  PriceButtonModel({required this.name, required this.color, required this.price});
}

class PriceButtonGrid extends StatefulWidget {
  final List<PriceButtonModel> priceButtons;
  double multiplier;

  PriceButtonGrid({required this.priceButtons, required this.multiplier});

  @override
  _PriceButtonGridState createState() => _PriceButtonGridState();
}

List<String> selectedActivities = [];
double selectedActivitiesPrice = 0;

class _PriceButtonGridState extends State<PriceButtonGrid> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.7,
      ),
      itemCount: widget.priceButtons.length,
      itemBuilder: (context, index) {
        final activity = widget.priceButtons[index];
        return ElevatedButton(
          onPressed: () {
            setState(() {
              selectedActivities.add('${widget.multiplier} x ${activity.name} ${activity.price}€');
              selectedActivitiesPrice += widget.multiplier * activity.price;
              trans.setData(selectedActivities, selectedActivitiesPrice,);
              print(widget.multiplier);
              widget.multiplier = 1; // Réinitialiser le multiplicateur
              print('$selectedActivities');
              print('$selectedActivitiesPrice');
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
}


class Burger extends StatefulWidget {
  final double initialSelectedActivitiesPrice;
  final List<String> initialSelectedActivities;

  Burger({
    required this.initialSelectedActivitiesPrice,
    required this.initialSelectedActivities,
  });

  @override
  _BurgerState createState() => _BurgerState();
}

class _BurgerState extends State<Burger> {
  late double selectedActivitiesPrice;
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
                  trans.reset();
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
          Divider(),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/paiments');
              },
              child: Text('Choix mode de paiments'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  double calculatePrice(String activity) {
    final parts = activity.split(' ');
    for (var i = 0; i < parts.length; i++) {
      parts[i] = parts[i].replaceAll("€", "");
    }
    double priceToDeduce = double.parse(parts[parts.length - 1]) * double.parse(parts[0]);
    return priceToDeduce;
  }
}


class Transfer {
   List<String> activitiesList;
   double activitiesPrice;

   Transfer(this.activitiesList, this.activitiesPrice);

   Map<String, dynamic> getData(){
    print('from getData $activitiesList $activitiesPrice');
    return {'activitiesList': activitiesList, 'activitiesPrice': activitiesPrice};
  }

  setData(activitiesList1, activitiesPrice1){
     this.activitiesList = activitiesList1;
     this.activitiesPrice = activitiesPrice1;
  }

  reset(){
     this.activitiesPrice = 0;
     this.activitiesList = [];
  }
}
