import 'package:firebasetest/contact%20lists/rtpcrlist.dart';
import 'package:firebasetest/map%20screens/firescreen.dart';
import 'package:firebasetest/map%20screens/hospitalscreen.dart';
import 'package:firebasetest/map%20screens/policescreen.dart';
import 'package:firebasetest/map%20screens/rtpcrscreen.dart';
import 'package:flutter/material.dart';

enum DialogsAction { yes, cancel }

class CovidDialogs {
  static Future<DialogsAction> yesCancelDialog(
    BuildContext context,
    String title,
    String body,
  ) async {
    final action = await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            title: Text(title),
            content: Text(body),
            actions: <Widget>[
              FlatButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RTPCRList()),
                ),
                child: Text(
                  'Show List',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
              FlatButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => rtpcrScreen()),
                ),
                child: Text(
                  'View Map',
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
