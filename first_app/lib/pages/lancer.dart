import 'package:flutter/material.dart';
import 'package:first_app/exportation.dart';

class Lancer extends StatelessWidget {
  final List<PriceButtonModel> priceButtons = [
    PriceButtonModel(name: 'Tomahawk', color: Colors.yellow, price: 10),
    PriceButtonModel(name: 'Couteau', color: Colors.yellow, price: 10),
    PriceButtonModel(name: 'Hache bois', color: Colors.yellow, price: 15),
    PriceButtonModel(name: 'Tomahawk + Couteau', color: Colors.yellow, price: 15),
    PriceButtonModel(name: 'Hache bois + autre', color: Colors.yellow, price: 20),
    PriceButtonModel(name: 'Tomahawk + Couteau + Hache', color: Colors.yellow, price: 25),
    PriceButtonModel(name: 'Fer à cheval', color: Colors.yellow, price: 5),
  ];

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
                Expanded(child: PriceButtonGrid(priceButtons: priceButtons)),
                SizedBox(height: 20),
                Numeric(),
              ]
          ),
        )
    );
  }
}