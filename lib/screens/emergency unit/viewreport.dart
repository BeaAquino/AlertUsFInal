import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetest/main.dart';
import 'package:firebasetest/map%20screens/firescreen.dart';
import 'package:firebasetest/map%20screens/hospitalscreen.dart';
import 'package:firebasetest/map%20screens/policescreen.dart';
import 'package:firebasetest/map%20screens/stationmap.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;

var currentUser = FirebaseAuth.instance.currentUser;
late String name;
late String phone;

enum DialogsAction { yes, cancel }

class ViewAlertDialogs {
  static Future<DialogsAction> yesCancelDialog(
    String uid,
    BuildContext context,
    String title,
    String body,
  ) async {
    final loc.Location location = loc.Location();
    StreamSubscription<loc.LocationData>? _locationSubscription;

    final action = await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text(title),
            content: Text(body),
            actions: <Widget>[
              FlatButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              FlatButton(
                onPressed: () async {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => StationMap()),
                  );
                },
                child: Text(
                  'Confirm',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        });
    return (action != null) ? action : DialogsAction.cancel;
  }
}
