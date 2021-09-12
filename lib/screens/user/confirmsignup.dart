import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetest/screens/emergency%20unit/createuserscreen.dart';
import 'package:firebasetest/screens/emergency%20unit/edituserdata.dart';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'profilesignup.dart';

class ConfirmUserSignup extends StatefulWidget {
  @override
  _ConfirmUserSignup createState() => _ConfirmUserSignup();
}

class _ConfirmUserSignup extends State<ConfirmUserSignup> {
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
        appBar: AppBar(
          title: Text(
            "Confirmation",
          ),
          backgroundColor: Colors.redAccent[700],
        ),
        backgroundColor: Colors.orange[200],
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Please confirm your email first,\nAfter confirming your email, set Profile Data",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          SizedBox(
            height: 50,
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: "Email",
            ),
          ),
          SizedBox(
            height: 10,
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
              color: Colors.redAccent[700],
              child: Center(
                child: Text("Confirm",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
          ableToEdit
              ? GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileSignUp(
                                  uid: uid,
                                )));
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    color: Colors.redAccent[700],
                    child: Center(
                      child: Text("Set Profile",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                          )),
                    ),
                  ),
                )
              : Container(),
          SizedBox(
            height: 20,
          ),
        ]));
  }
}
