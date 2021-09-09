import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetest/screens/reportdialog.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PoliceScreen extends StatefulWidget {
  @override
  _PoliceScreen createState() => _PoliceScreen();
}

class _PoliceScreen extends State<PoliceScreen> {
  String name;
  String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Police Report",
        ),
        backgroundColor: Colors.redAccent[700],
      ),
      backgroundColor: Colors.orange[200],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
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
                      height: 110.0,
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
                                  'Homicide Incident,\nSend Assistance.\n\nReport by:' +
                                      currentUser.email +
                                      '\nname : ' +
                                      name +
                                      '\nphone number : ' +
                                      phone);
                            }
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.emoji_people_rounded,
                                  size: 50.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "HOMICIDE",
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
                      height: 110.0,
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
                                  'Violence/Brawl Incident,\nSend Assistance.\n\nReport by:' +
                                      currentUser.email +
                                      '\nname : ' +
                                      name +
                                      '\nphone number : ' +
                                      phone);
                            }
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.dangerous_rounded,
                                  size: 50.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "VIOLENCE/BRAWL",
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
                      height: 110.0,
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
                                    'Burglary/Theft Incident,\nSend Assistance.\n\nReport by:' +
                                        currentUser.email +
                                        '\nname : ' +
                                        name +
                                        '\nphone number : ' +
                                        phone);
                              }
                            },
                            child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.lock,
                                        size: 50.0,
                                        color: Colors.yellowAccent,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "BURGLARY/THEFT",
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
                      height: 110.0,
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
                                  'Domestic Threat Incident,\nSend Assistance.\n\nReport by:' +
                                      currentUser.email +
                                      '\nname : ' +
                                      name +
                                      '\nphone number : ' +
                                      phone);
                            }
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.groups_rounded,
                                  size: 50.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "DOMESTIC THREAT",
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
                      height: 110.0,
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
                                  'Sexual Assault Incident,\nSend Assistance.\n\nReport by:' +
                                      currentUser.email +
                                      '\nname : ' +
                                      name +
                                      '\nphone number : ' +
                                      phone);
                            }
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.priority_high_rounded,
                                  size: 50.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "SEXUAL ASSULT",
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
                      height: 110.0,
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
                                  'Missing or Kidnapping Incident,\nSend Assistance.\n\nReport by:' +
                                      currentUser.email +
                                      '\nname : ' +
                                      name +
                                      '\nphone number : ' +
                                      phone);
                            }
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.person_search_rounded,
                                  size: 50.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "MISSING/KIDNAPPING",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 173.0,
                      height: 110.0,
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
                                  'Terrorist Incident,\nSend Assistance.\n\nReport by:' +
                                      currentUser.email +
                                      '\nname : ' +
                                      name +
                                      '\nphone number : ' +
                                      phone);
                            }
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.no_accounts_rounded,
                                  size: 50.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "TERRORIST",
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
                      height: 110.0,
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
                                  'In need of Police Assistance\n\nReport by:' +
                                      currentUser.email +
                                      '\nname : ' +
                                      name +
                                      '\nphone number : ' +
                                      phone);
                            }
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.outbond_rounded,
                                  size: 50.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 10.0,
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
