import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetest/screens/createuserscreen.dart';
import 'package:firebasetest/screens/edituserdata.dart';
import 'package:flutter/material.dart';
import 'profile.dart';

class ConfirmUser extends StatefulWidget {
  @override
  _ConfirmUser createState() => _ConfirmUser();
}

class _ConfirmUser extends State<ConfirmUser> {
  TextEditingController emailController = new TextEditingController();
  String email = " ";
  String uid = " ";
  String role = " ";
  String password = " ";
  String name = " ";
  String phone = " ";

  bool ableToEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Text(
          "Welcome User\n Set up your Profile\n These data will be sent to your chosen emergency unit"),
      SizedBox(
        height: 50,
      ),
      Text("Please confirm your email first"),
      SizedBox(
        height: 50,
      ),
      TextFormField(
        controller: emailController,
        decoration: InputDecoration(
          hintText: "Email",
        ),
      ),
      GestureDetector(
        onTap: () async {
          String userEmail = emailController.text.trim();

          final QuerySnapshot snap = await FirebaseFirestore.instance
              .collection('users')
              .where('email', isEqualTo: userEmail)
              .get();
          setState(() {
            email = userEmail;
            uid = snap.docs[0]['uid'];
            role = snap.docs[0]['role'];
            name = snap.docs[0]['name'];
            phone = snap.docs[0]['phone'];

            ableToEdit = true;
          });
        },
        child: Container(
          height: 50,
          width: 100,
          color: Colors.blue,
          child: Center(
            child: Text(
              "Current Data",
            ),
          ),
        ),
      ),
      ableToEdit
          ? GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(
                              uid: uid,
                            )));
              },
              child: Container(
                height: 50,
                width: 100,
                color: Colors.blue,
                child: Center(
                  child: Text(
                    "Edit Profile",
                  ),
                ),
              ),
            )
          : Container(),
      SizedBox(
        height: 50,
      ),
      Text('User Data :'),
      SizedBox(
        height: 50,
      ),
      Text('Email : ' + email),
      Text('UID : ' + uid),
      Text('Role : ' + role),
      Text('Name : ' + name),
      Text('Phone : ' + phone),
    ]));
  }
}
