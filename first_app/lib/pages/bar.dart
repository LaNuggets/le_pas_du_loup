import 'package:flutter/material.dart';
import 'package:first_app/exportation.dart';

class Bar extends StatelessWidget {
  final List<PriceButtonModel> priceButtons = [
    PriceButtonModel(name: 'Cannette', color: Colors.brown, price: 2),
    PriceButtonModel(name: 'Bière', color: Colors.brown, price: 4),
    PriceButtonModel(name: 'Eau 0,5L', color: Colors.brown, price: 1),
    PriceButtonModel(name: 'Eau 1,5L', color: Colors.brown, price: 1.5),
    PriceButtonModel(name: 'Jus', color: Colors.brown, price: 1.5),
    PriceButtonModel(name: 'Terrine', color: Colors.brown, price: 6),
    PriceButtonModel(name: 'Petite Terrine', color: Colors.brown, price: 4),
    PriceButtonModel(name: 'Boudin', color: Colors.brown, price: 6),
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