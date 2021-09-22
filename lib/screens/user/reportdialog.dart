import 'package:firebasetest/map%20screens/firescreen.dart';
import 'package:firebasetest/map%20screens/hospitalscreen.dart';
import 'package:firebasetest/map%20screens/policescreen.dart';
import 'package:flutter/material.dart';

enum DialogsAction { yes, cancel }

class AlertDialogs {
  static Future<DialogsAction> yesCancelDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
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
                onPressed: () =>
                    Navigator.of(context).pop(DialogsAction.cancel),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              FlatButton(
                onPressed: () {
                  if (title == "Fire Report") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FireScreen()),
                    );
                  }
                  if (title == "Hospital Report") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HospitalScreen()),
                    );
                  }
                  if (title == "Police Report") {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PoliceScreen()),
                    );
                  }
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
