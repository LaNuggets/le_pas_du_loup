import 'package:flutter/material.dart';
import 'package:first_app/exportation.dart';

class Arc_attaque extends StatefulWidget {
  @override
  _Arc_attaqueState createState() => _Arc_attaqueState();
}

class _Arc_attaqueState extends State<Arc_attaque> {
  final List<PriceButtonModel> priceButtons = [
    PriceButtonModel(name: 'Arc attaque Adulte', color: Colors.deepOrange, price: 20),
    PriceButtonModel(name: 'Arc attaque Enfant', color: Colors.deepOrange, price: 15),
  ];
  double multiplier = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Paintball'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PriceButtonGrid(
                priceButtons: priceButtons,
                multiplier: multiplier,
              ),
            ),
            SizedBox(height: 20),
            Numeric(
              onMultiplierChanged: (value) {
                setState(() {
                  multiplier = value; // Met à jour multiplier et reconstruit l'UI
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
