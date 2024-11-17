import 'package:flutter/material.dart';
import 'package:first_app/exportation.dart';

class Tir_arc extends StatefulWidget{
  @override
  _Tir_arcState createState() => _Tir_arcState();
}

class _Tir_arcState extends State<Tir_arc> {
  final List<PriceButtonModel> priceButtons = [
    PriceButtonModel(name: 'Tir à l\'arc adulte', color: Colors.pinkAccent, price: 20),
    PriceButtonModel(name: 'Tir à l\'arc Enfant', color: Colors.pinkAccent, price: 15),
    PriceButtonModel(name: 'Location matos', color: Colors.pinkAccent, price: 10),
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