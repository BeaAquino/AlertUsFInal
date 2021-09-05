import 'package:flutter/material.dart';

class EmergencyContactList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Emergency Unit Contacts",
        ),
        backgroundColor: Colors.redAccent[700],
      ),
      backgroundColor: Colors.orange[200],
      body: SafeArea(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "List of Emergency Contacts",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              width: 360.0,
              height: 70.0,
              child: Card(
                color: Colors.orange,
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Text(" Hospital List",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  ),
                )),
              ),
            ),
            SizedBox(
              width: 360.0,
              height: 70.0,
              child: Card(
                color: Colors.orange,
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Text(" Police Station List",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  ),
                )),
              ),
            ),
            SizedBox(
              width: 360.0,
              height: 70.0,
              child: Card(
                color: Colors.orange,
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: Row(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Text(" Fire Station List",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                      )
                    ],
                  ),
                )),
              ),
            ),
          ])),
    );
  }
}
