import 'package:flutter/material.dart';
import 'package:first_app/exportation.dart';

class Sarbacane extends StatefulWidget{
  @override
  _SarbacaneState createState() => _SarbacaneState();
}

class _SarbacaneState extends State<Sarbacane> {
  final List<PriceButtonModel> priceButtons = [
    PriceButtonModel(name: 'Sarbacane', color: Colors.lightBlueAccent, price: 5),
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