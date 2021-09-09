import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetest/screens/reportdialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HospitalScreen extends StatefulWidget {
  @override
  _HospitalScreen createState() => _HospitalScreen();
}

class _HospitalScreen extends State<HospitalScreen> {
  String name;
  String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hospital Report",
        ),
        backgroundColor: Colors.redAccent[700],
      ),
      backgroundColor: Colors.orange[200],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "WHAT HAS HAPPENED?",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 5.0,
                  children: <Widget>[
                    SizedBox(
                      width: 173.0,
                      height: 100.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () async {
                            var currentUser = FirebaseAuth.instance.currentUser;

                            if (currentUser != null) {
                              final QuerySnapshot snap = await FirebaseFirestore
                                  .instance
                                  .collection('users')
                                  .where('email', isEqualTo: currentUser.email)
                                  .get();
                              setState(() {
                                name = snap.docs[0]['name'];
                                phone = snap.docs[0]['phone'];
                              });
                              final action = await AlertDialogs.yesCancelDialog(
                                  context,
                                  'Report Message',
                                  'Abdominal/Chest Pain,\nSend Assistance.\n\nReport by:' +
                                      currentUser.email +
                                      '\nname : ' +
                                      name +
                                      '\nphone number : ' +
                                      phone);
                            }
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.sports_handball_rounded,
                                  size: 40.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Text(
                                  " ABDOMINAL/CHEST\n               PAIN",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 173.0,
                      height: 100.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () async {
                            var currentUser = FirebaseAuth.instance.currentUser;

                            if (currentUser != null) {
                              final QuerySnapshot snap = await FirebaseFirestore
                                  .instance
                                  .collection('users')
                                  .where('email', isEqualTo: currentUser.email)
                                  .get();
                              setState(() {
                                name = snap.docs[0]['name'];
                                phone = snap.docs[0]['phone'];
                              });
                              final action = await AlertDialogs.yesCancelDialog(
                                  context,
                                  'Report Message',
                                  'Traumatic Injury,\nSend Assistance.\n\nReport by:' +
                                      currentUser.email +
                                      '\nname : ' +
                                      name +
                                      '\nphone number : ' +
                                      phone);
                            }
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.dangerous_rounded,
                                  size: 40.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  "TRAUMATIC INJURY",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 173.0,
                      height: 100.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                            onTap: () async {
                              var currentUser =
                                  FirebaseAuth.instance.currentUser;

                              if (currentUser != null) {
                                final QuerySnapshot snap =
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        .where('email',
                                            isEqualTo: currentUser.email)
                                        .get();
                                setState(() {
                                  name = snap.docs[0]['name'];
                                  phone = snap.docs[0]['phone'];
                                });
                                final action = await AlertDialogs.yesCancelDialog(
                                    context,
                                    'Report Message',
                                    'Respiratory Distress,\nSend Assistance.\n\nReport by:' +
                                        currentUser.email +
                                        '\nname : ' +
                                        name +
                                        '\nphone number : ' +
                                        phone);
                              }
                            },
                            child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.healing_rounded,
                                        size: 40.0,
                                        color: Colors.yellowAccent,
                                      ),
                                      SizedBox(
                                        height: 2.0,
                                      ),
                                      Text(
                                        "RESPIRATORY\n    DISTRESS",
                                        style: TextStyle(
                                            color: Colors.yellowAccent,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  )),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 173.0,
                      height: 100.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () async {
                            var currentUser = FirebaseAuth.instance.currentUser;

                            if (currentUser != null) {
                              final QuerySnapshot snap = await FirebaseFirestore
                                  .instance
                                  .collection('users')
                                  .where('email', isEqualTo: currentUser.email)
                                  .get();
                              setState(() {
                                name = snap.docs[0]['name'];
                                phone = snap.docs[0]['phone'];
                              });
                              final action = await AlertDialogs.yesCancelDialog(
                                  context,
                                  'Report Message',
                                  'Severe Burns/Scald,\nSend Assistance.\n\nReport by:' +
                                      currentUser.email +
                                      '\nname : ' +
                                      name +
                                      '\nphone number : ' +
                                      phone);
                            }
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.whatshot_rounded,
                                  size: 40.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Text(
                                  "SEVERE BURNS OR\n          SCALD",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 173.0,
                      height: 100.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () async {
                            var currentUser = FirebaseAuth.instance.currentUser;

                            if (currentUser != null) {
                              final QuerySnapshot snap = await FirebaseFirestore
                                  .instance
                                  .collection('users')
                                  .where('email', isEqualTo: currentUser.email)
                                  .get();
                              setState(() {
                                name = snap.docs[0]['name'];
                                phone = snap.docs[0]['phone'];
                              });
                              final action = await AlertDialogs.yesCancelDialog(
                                  context,
                                  'Report Message',
                                  'Loss of Consciousness Incident,\nSend Assistance.\n\nReport by:' +
                                      currentUser.email +
                                      '\nname : ' +
                                      name +
                                      '\nphone number : ' +
                                      phone);
                            }
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.airline_seat_flat,
                                  size: 40.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Text(
                                  "          LOSS OF\n CONSCIOUSNESS",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 173.0,
                      height: 100.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () async {
                            var currentUser = FirebaseAuth.instance.currentUser;

                            if (currentUser != null) {
                              final QuerySnapshot snap = await FirebaseFirestore
                                  .instance
                                  .collection('users')
                                  .where('email', isEqualTo: currentUser.email)
                                  .get();
                              setState(() {
                                name = snap.docs[0]['name'];
                                phone = snap.docs[0]['phone'];
                              });
                              final action = await AlertDialogs.yesCancelDialog(
                                  context,
                                  'Report Message',
                                  'Seizure Incident,\nSend Assistance.\n\nReport by:' +
                                      currentUser.email +
                                      '\nname : ' +
                                      name +
                                      '\nphone number : ' +
                                      phone);
                            }
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.block_rounded,
                                  size: 50.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Text(
                                  "SEIZURE",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 173.0,
                      height: 100.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () async {
                            var currentUser = FirebaseAuth.instance.currentUser;

                            if (currentUser != null) {
                              final QuerySnapshot snap = await FirebaseFirestore
                                  .instance
                                  .collection('users')
                                  .where('email', isEqualTo: currentUser.email)
                                  .get();
                              setState(() {
                                name = snap.docs[0]['name'];
                                phone = snap.docs[0]['phone'];
                              });
                              final action = await AlertDialogs.yesCancelDialog(
                                  context,
                                  'Report Message',
                                  'Poisoning/drug ingestion Incident,\nSend Assistance.\n\nReport by:' +
                                      currentUser.email +
                                      '\nname : ' +
                                      name +
                                      '\nphone number : ' +
                                      phone);
                            }
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.do_not_touch_rounded,
                                  size: 40.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Text(
                                  "POISONING/DRUG\n      INGESTION",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 173.0,
                      height: 100.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () async {
                            var currentUser = FirebaseAuth.instance.currentUser;

                            if (currentUser != null) {
                              final QuerySnapshot snap = await FirebaseFirestore
                                  .instance
                                  .collection('users')
                                  .where('email', isEqualTo: currentUser.email)
                                  .get();
                              setState(() {
                                name = snap.docs[0]['name'];
                                phone = snap.docs[0]['phone'];
                              });
                              final action = await AlertDialogs.yesCancelDialog(
                                  context,
                                  'Report Message',
                                  'Stroke Incident,\n\nReport by:' +
                                      currentUser.email +
                                      '\nname : ' +
                                      name +
                                      '\nphone number : ' +
                                      phone);
                            }
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.priority_high_rounded,
                                  size: 45.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Text(
                                  "STROKE",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 173.0,
                      height: 100.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () async {
                            var currentUser = FirebaseAuth.instance.currentUser;

                            if (currentUser != null) {
                              final QuerySnapshot snap = await FirebaseFirestore
                                  .instance
                                  .collection('users')
                                  .where('email', isEqualTo: currentUser.email)
                                  .get();
                              setState(() {
                                name = snap.docs[0]['name'];
                                phone = snap.docs[0]['phone'];
                              });
                              final action = await AlertDialogs.yesCancelDialog(
                                  context,
                                  'Report Message',
                                  'Emergency Childbirth,\n\nReport by:' +
                                      currentUser.email +
                                      '\nname : ' +
                                      name +
                                      '\nphone number : ' +
                                      phone);
                            }
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.baby_changing_station_rounded,
                                  size: 40.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Text(
                                  "EMERGENCY\n CHILDBIRTH",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 173.0,
                      height: 100.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () async {
                            var currentUser = FirebaseAuth.instance.currentUser;

                            if (currentUser != null) {
                              final QuerySnapshot snap = await FirebaseFirestore
                                  .instance
                                  .collection('users')
                                  .where('email', isEqualTo: currentUser.email)
                                  .get();
                              setState(() {
                                name = snap.docs[0]['name'];
                                phone = snap.docs[0]['phone'];
                              });
                              final action = await AlertDialogs.yesCancelDialog(
                                  context,
                                  'Report Message',
                                  'In need of Medical Assitance,\n\nReport by:' +
                                      currentUser.email +
                                      '\nname : ' +
                                      name +
                                      '\nphone number : ' +
                                      phone);
                            }
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.outbond_rounded,
                                  size: 50.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Text(
                                  "OTHERS",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
