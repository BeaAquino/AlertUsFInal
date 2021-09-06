// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         title: Text("Dashboard"),
//         backgroundColor: Colors.redAccent[700],
//       ),
//       body: Center(
//         child: Text("THIS IS HOME"),
//       ),
//     );
//   }
// }
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetest/screens/mainscreen.dart';
import 'package:flutter/material.dart';
import 'hospitalscreen.dart';
import 'policescreen.dart';
import 'firescreen.dart';
import 'emergencycontactlist.dart';
import 'contactus.dart';
import 'profile.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController emailController = new TextEditingController();
  String email = " ";
  String uid = " ";
  String role = " ";
  String password = " ";

  bool ableToEdit = false;

  @override
  void initState() {
    super.initState();
  }

//class HomeScreen extends StatelessWidget {
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
                "User",
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              accountEmail: new Text("tester@gmail.com"),
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
                      builder: (context) => Profile(
                          // uid: uid,
                          ),
                    ));
              },
              title: Text("Profile"),
            ),
            ableToEdit
                ? GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Profile()));
                    },
                    child: Container(
                      height: 50,
                      width: 100,
                      color: Colors.blue,
                      child: Center(
                        child: Text(
                          "Edit User",
                        ),
                      ),
                    ),
                  )
                : Container(),
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
                Icons.info,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
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
                "AlertUs \nSelect an Emergency",
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
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FireScreen()),
                              );
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
