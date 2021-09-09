import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetest/screens/confirmuser.dart';
import 'package:firebasetest/screens/mainscreen.dart';
import 'package:firebasetest/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'hospitalscreen.dart';
import 'policescreen.dart';
import 'firescreen.dart';
import 'emergencycontactlist.dart';
import 'contactus.dart';
import 'profile.dart';
import 'package:firebasetest/screens/reportdialog.dart';

final AuthService _auth = AuthService(FirebaseAuth.instance);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  String name;
  String phone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Dashboard"),
        backgroundColor: Colors.redAccent[700],
      ),
      backgroundColor: Colors.orange[200],
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: new Text(
                "Welcome",
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              accountEmail: new Text("to AlertUs "),
              decoration: new BoxDecoration(color: Colors.redAccent[700]),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmUser(),
                    ));
              },
              title: Text("Profile"),
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUs()),
                );
              },
              title: Text("About Us"),
            ),
            ListTile(
              leading: Icon(
                Icons.logout_rounded,
                color: Colors.black,
              ),
              onTap: () async {
                await _auth.signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ));
              },
              title: Text("Log Out"),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "Select an Emergency",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 5.0,
                  children: <Widget>[
                    SizedBox(
                      width: 175.0,
                      height: 160.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HospitalScreen()),
                            );
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.local_hospital_rounded,
                                  size: 90.0,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "HOSPITAL",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 175.0,
                      height: 160.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PoliceScreen()),
                            );
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.local_police_rounded,
                                  size: 90.0,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "POLICE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 175.0,
                      height: 160.0,
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
                                final action =
                                    await AlertDialogs.yesCancelDialog(
                                        context,
                                        'Report Message',
                                        'FIRE!!!.\n\nReport by:' +
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
                                        Icons.fireplace_rounded,
                                        size: 90.0,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "FIRE",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                    ],
                                  )),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 175.0,
                      height: 160.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () {},
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.coronavirus_rounded,
                                  size: 90.0,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "COVID-19",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 360.0,
                      height: 70.0,
                      child: Card(
                          color: Colors.redAccent[700],
                          elevation: 1.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0)),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EmergencyContactList()),
                              );
                            },
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: Row(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Icon(
                                      Icons.phone_callback_rounded,
                                      size: 50.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text("  EMERGENCY UNIT CONTACTS",
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
