import 'package:flutter/material.dart';
import 'package:first_app/exportation.dart';

class Paintball extends StatefulWidget{
  @override
  _PaintballState createState() => _PaintballState();
}

class _PaintballState extends State<Paintball> {
  final List<PriceButtonModel> priceButtons = [
    PriceButtonModel(name: 'Paintball Adultes', color: Colors.lightGreen, price: 25),
    PriceButtonModel(name: 'Paintball Enfants', color: Colors.lightGreen, price: 18),
    PriceButtonModel(name: 'Paintball Cronus', color: Colors.lightGreen, price: 45),
    PriceButtonModel(name: 'Paintball sac 500 billes', color: Colors.lightGreen, price: 25),
    PriceButtonModel(name: 'Tir sur cible', color: Colors.lightGreen, price: 10),
    PriceButtonModel(name: 'Tir sur cible pompe', color: Colors.lightGreen, price: 8),
    PriceButtonModel(name: 'Tir sur cible Cronus', color: Colors.lightGreen, price: 25),
    PriceButtonModel(name: 'Tir sur cible 100 billes', color: Colors.lightGreen, price: 5),
    PriceButtonModel(name: 'Tir parcours', color: Colors.lightGreen, price: 15),
    PriceButtonModel(name: 'Tir parcours Cronus', color: Colors.lightGreen, price: 30),
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