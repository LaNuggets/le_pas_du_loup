import 'package:flutter/material.dart';
import 'package:first_app/exportation.dart';

class Tir_arc extends StatelessWidget {
  final List<PriceButtonModel> priceButtons = [
    PriceButtonModel(name: 'Tir à l\'arc adulte', color: Colors.pinkAccent, price: 20),
    PriceButtonModel(name: 'Tir à l\'arc Enfant', color: Colors.pinkAccent, price: 15),
    PriceButtonModel(name: 'Location matos', color: Colors.pinkAccent, price: 10),
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