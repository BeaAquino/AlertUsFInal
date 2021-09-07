import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetest/screens/adminscreen.dart';
import 'package:firebasetest/screens/confirmuser.dart';
import 'package:firebasetest/screens/homescreen.dart';
import 'package:firebasetest/screens/profilesignup.dart';
import 'package:flutter/material.dart';
import 'confirmsignup.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String role = 'user';

  @override
  void initState() {
    super.initState();
    _checkRole();
  }

  void _checkRole() async {
    User user = FirebaseAuth.instance.currentUser;
    final DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(user.uid)
        .get();

    setState(() {
      role = snap['role'];
    });

    if (role == 'user') {
      navigateNext(ConfirmUserSignup()); // edited from HomeScreen to ConfirmUser
    } else if (role == 'admin') {
      navigateNext(AdminScreen());
    }
  }

  void navigateNext(Widget route) {
    Timer(Duration(milliseconds: 500), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => route));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20.0),
              Container(
                height: 300,
                child: Image(
                  image: AssetImage("images/welcome.jpg"),
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: 20),
              RichText(
                  text: TextSpan(
                      text: '   Welcome to ',
                      style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      children: <TextSpan>[
                    TextSpan(
                        text: '  AlertUs',
                        style: TextStyle(
                            fontSize: 60.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.red[900]))
                  ])),
            ],
          ),
        ),
      ),
    );
  }
}
