import 'package:flutter/material.dart';
import 'package:first_app/exportation.dart';

class Boutique extends StatefulWidget{
  @override
  _BoutiqueState createState() => _BoutiqueState();
}

class _BoutiqueState extends State<Boutique> {
  final List<PriceButtonModel> priceButtons = [
    PriceButtonModel(name: 'Costume', color: Colors.red, price: 25),
    PriceButtonModel(name: 'Gants', color: Colors.red, price: 8),
    PriceButtonModel(name: 'Fumigène', color: Colors.red, price: 10),
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
                Expanded(child: PriceButtonGrid(priceButtons: priceButtons, multiplier: multiplier)),
                SizedBox(height: 20),
                Numeric(
                    onMultiplierChanged: (value) {
                      setState(() {
                        multiplier = value;
                      });
                    }
                ),
              ]
          ),
        )
    );
  }
}