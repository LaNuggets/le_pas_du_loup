import 'package:flutter/material.dart';
import 'package:first_app/exportation.dart';

class Sarbacane extends StatelessWidget {
  final List<PriceButtonModel> priceButtons = [
    PriceButtonModel(name: 'Sarbacane', color: Colors.lightBlueAccent, price: 5),
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