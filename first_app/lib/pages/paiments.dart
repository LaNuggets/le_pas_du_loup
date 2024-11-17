import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Paiments extends StatefulWidget{
  @override
  _PaimentsState createState() => _PaimentsState();
}

class PaimentsMode {
  final String name;
  final Color color;

  PaimentsMode({required this.name, required this.color});
}

class _PaimentsState extends State<Paiments> {
  final List<PaimentsMode> paimentsMode = [
    PaimentsMode(name: 'Cart', color: Colors.blue),
    PaimentsMode(name: 'Espece', color: Colors.yellow),
    PaimentsMode(name: 'Chèque', color: Colors.grey),
    PaimentsMode(name: 'Ticket réstorant', color: Colors.orange),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Paiments'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(child: buildPaimentsButtons()),
            ],
          ),
        )
    );
  }

  Widget buildPaimentsButtons(){
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1.7,
      ),
      itemCount: paimentsMode.length,
      itemBuilder: (context, index){
        final paiment = paimentsMode[index];
        return ElevatedButton(
          onPressed: () {
            print('yeah');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: paiment.color,
            foregroundColor: Colors.black,
            side: BorderSide(color: Colors.black, width: 1),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
          ),
          child: Text(paiment.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        );
    }
    );
  }
}