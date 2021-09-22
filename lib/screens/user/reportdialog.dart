// import 'package:firebasetest/map%20screens/firescreen.dart';
// import 'package:firebasetest/map%20screens/hospitalscreen.dart';
// import 'package:firebasetest/map%20screens/policescreen.dart';
// import 'package:flutter/material.dart';

// enum DialogsAction { yes, cancel }

// class AlertDialogs {
//   static Future<DialogsAction> yesCancelDialog(
//     BuildContext context,
//     String title,
//     String body,
//   ) async {
//     final action = await showDialog(
//         context: context,
//         barrierDismissible: false,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(10.0)),
//             title: Text(title),
//             content: Text(body),
//             actions: <Widget>[
//               FlatButton(
//                 onPressed: () =>
//                     Navigator.of(context).pop(DialogsAction.cancel),
//                 child: Text(
//                   'Cancel',
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               FlatButton(
//                 onPressed: () {
//                   if (title == "Fire Report") {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => FireScreen()),
//                     );
//                   }
//                   if (title == "Hospital Report") {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => HospitalScreen()),
//                     );
//                   }
//                   if (title == "Police Report") {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => PoliceScreen()),
//                     );
//                   }
//                 },
//                 child: Text(
//                   'Confirm',
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           );
//         });
//     return (action != null) ? action : DialogsAction.cancel;
//   }
// }
import 'package:firebasetest/map%20screens/firescreen.dart';
import 'package:firebasetest/map%20screens/hospitalscreen.dart';
import 'package:firebasetest/map%20screens/policescreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart' as loc;

enum DialogsAction { yes, cancel }

class AlertDialogs {
  static Future<DialogsAction> yesCancelDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    String userid = "G6Nn13uZbqeam5a3xoJh5r3Wb5p1";
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
                onPressed: () =>
                    Navigator.of(context).pop(DialogsAction.cancel),
                child: Text(
                  'Cancel',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              FlatButton(
                onPressed: () async {
                  try {
                    final loc.LocationData _locationResult =
                        await location.getLocation();
                    await FirebaseFirestore.instance
                        .collection('users')
                        .doc(userid)
                        .set({
                      'latitude': _locationResult.latitude,
                      'longitude': _locationResult.longitude,
                    }, SetOptions(merge: true));
                  } catch (e) {
                    print(e);
                  }
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
