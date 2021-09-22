import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetest/screens/emergency%20unit/createuserscreen.dart';
import 'package:firebasetest/screens/emergency%20unit/edituserdata.dart';
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
  String police_message = " ";
  String hospital_message = " ";
  String fire_message = " ";
  String longitude = " ";
  String latitude = " ";

  bool ableToEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Profile",
          ),
          backgroundColor: Colors.redAccent[700],
        ),
        backgroundColor: Colors.orange[200],
        body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Please confirm your email first",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Text(
            " after confirming your email, you may edit your profile",
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          SizedBox(
            height: 50,
          ),
          TextFormField(
            controller: emailController,
            validator: (val) =>
                val.isNotEmpty ? null : "Please Enter E-mail Address",
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none),
              fillColor: Colors.white,
              filled: true,
              hintText: "Email",
              prefixIcon: Icon(
                Icons.email,
                color: Colors.grey[400],
              ),
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
                police_message = snap.docs[0]['police message'];
                fire_message = snap.docs[0]['fire message'];
                hospital_message = snap.docs[0]['hospital message'];
                longitude = snap.docs[0]['longitude'];
                latitude = snap.docs[0]['latitude'];

                ableToEdit = true;
              });
            },
            child: Container(
              height: 50,
              width: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.redAccent[700],
              ),
              child: Center(
                child: Text("VIEW DATA",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    )),
              ),
            ),
          ),
          SizedBox(
            height: 5,
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
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.redAccent[700],
                    ),
                    child: Center(
                      child: Text("Edit Profile",
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
          Text(
            'User Data :',
            style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Email : ' + email,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Text(
            'Name : ' + name,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Text(
            'Phone : ' + phone,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Text(
            'longitude : ' + longitude,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          Text(
            'latitude : ' + latitude,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
        ]));
  }
}
