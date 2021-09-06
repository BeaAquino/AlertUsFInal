import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Create Profile",
        ),
        backgroundColor: Colors.redAccent[700],
      ),
      backgroundColor: Colors.orange[200],
      body: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.person),
                hintText: "Name"),
          ),
          TextFormField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Phone Number",
                prefixIcon: Icon(Icons.phone)),
            maxLength: 11,
          ),
          SizedBox(
            width: 200.0,
            height: 50.0,
            child: Card(
                color: Colors.redAccent[700],
                elevation: 1.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                child: InkWell(
                  onTap: () {},
                  child: Center(
                      child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Row(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.centerLeft,
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Text("              SAVE",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              )),
                        )
                      ],
                    ),
                  )),
                )),
          )
        ],
      ),
    );
  }
}
