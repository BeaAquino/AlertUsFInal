import 'package:flutter/material.dart';

class FireStationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List of Fire Stations",
        ),
        backgroundColor: Colors.redAccent[700],
      ),
      backgroundColor: Colors.orange[200],
      body: Center(
          child: new SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Text(
                'Angeles City Fire Station\nAddress: Rizal St, San. Nicola, Angeles, Pampanga\nContacts: (045) 322-6758\n  \nAngeles City Central Fire Station\nAddress: Pulung Maragul, Angeles, Pampanga\nContacts: (045) 322-23332',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold),
              ))),
    );
  }
}
