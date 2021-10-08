// DI PA NAGAGAMIT NA CODE TOOO , AYUSIN KO LATER MEGAN :D
import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetest/contact%20lists/rtpcrlist.dart';
import 'package:firebasetest/map%20screens/firescreen.dart';
import 'package:firebasetest/map%20screens/hospitalscreen.dart';
import 'package:firebasetest/map%20screens/policescreen.dart';
import 'package:firebasetest/map%20screens/rtpcrscreen.dart';
import 'package:firebasetest/screens/user/confirmsendingreport.dart';
import 'package:firebasetest/screens/user/confirmviewmap.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:location/location.dart' as loc;

var currentUser = FirebaseAuth.instance.currentUser;
enum DialogsAction { yes, cancel }

class FireDialogs {
  static Future<DialogsAction> yesCancelDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    String userid = currentUser.uid;
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
                  if (currentUser != null) {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(currentUser.uid)
                        .update({
                      'longitude': 0,
                      'latitude': 0,
                    });
                  }
                  Navigator.of(context).pop(DialogsAction.cancel);
                },
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
                    final loc.LocationData _locationResult =
                        await location.getLocation();
                    FirebaseFirestore.instance
                        .collection("fire reports")
                        .doc(currentUser.uid)
                        .set({
                      'uid': currentUser.uid,
                      'fire message': body,
                      'latitude': _locationResult.latitude,
                      'longitude': _locationResult.longitude,
                      'createdOn': DateTime.now().toString().substring(0, 16),
                    });
                    final action = await ConfirmSendingReport.yesCancelDialog(
                        context,
                        'Report Sent',
                        'Your Report and Current Location has been sent to the Authorities,\n\nPlease wait patiently for the Authorities to contact you.\n\n\nKindly press EXIT, to end the session.\n\nReport Message:\n' +
                            body);
                  }
                },
                child: Text(
                  'Confirm Report',
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
                  final action = await ConfirmViewMap.yesCancelDialog(
                      context,
                      'Closest Fire Station',
                      'Would you like to view the location of the closest Fire Station?\n\nOnce you press DONE,The session will end.');
                },
                child: Text(
                  'View Closest Fire Station',
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




// import 'package:firebasetest/contact%20lists/rtpcrlist.dart';
// import 'package:flutter/material.dart';

// enum CovidAction { yes }

// class Covid_option {
//   static Future<CovidAction> yesCancelDialog(
//     BuildContext context,
//     String title,
//     String body,
//   ) async {
//     final action = await showDialog(
//         context: context,
//         // barrierDismissible: false,
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
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => RTPCRList()),
//                   );
//                 },
//                 child: Text(
//                   'Show list',
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                 ),
//               ),
//               FlatButton(
//                 onPressed:
//                     () {}, // dito ilalagay yung route ng gps ng emergency unit na magrereceive ng notif
//                 child: Text(
//                   'Show Map',
//                   style: TextStyle(
//                       color: Colors.black, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ],
//           );
//         });
//     // return (action != null) ? action : DialogsAction.cancel;
//   }
// }
