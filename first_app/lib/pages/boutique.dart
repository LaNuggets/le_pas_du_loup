import 'package:flutter/material.dart';
import 'package:first_app/exportation.dart';

class Boutique extends StatelessWidget {
  final List<PriceButtonModel> priceButtons = [
    PriceButtonModel(name: 'Costume', color: Colors.red, price: 25),
    PriceButtonModel(name: 'Gants', color: Colors.red, price: 8),
    PriceButtonModel(name: 'Fumigène', color: Colors.red, price: 10),
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