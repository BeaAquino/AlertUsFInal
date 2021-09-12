import 'package:firebasetest/screens/rtpcrlist.dart';
import 'package:flutter/material.dart';

enum DialogsAction { yes }

class Covid_option {
  static Future<DialogsAction> yesCancelDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
        context: context,
        // barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text(title),
            content: Text(body),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RTPCRList()),
                  );
                },
                child: Text(
                  'Show list',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              FlatButton(
                onPressed:
                    () {}, // dito ilalagay yung route ng gps ng emergency unit na magrereceive ng notif
                child: Text(
                  'Show Map',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          );
        });
    // return (action != null) ? action : DialogsAction.cancel;
  }
}
