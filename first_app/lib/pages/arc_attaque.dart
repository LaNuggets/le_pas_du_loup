import 'package:flutter/material.dart';
import 'package:first_app/exportation.dart';

class Arc_attaque extends StatelessWidget {
  final List<PriceButtonModel> priceButtons = [
    PriceButtonModel(name: 'Arc attaque Adulte', color: Colors.deepOrange, price: 20),
    PriceButtonModel(name: 'Arc attaque Enfant', color: Colors.deepOrange, price: 15),
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