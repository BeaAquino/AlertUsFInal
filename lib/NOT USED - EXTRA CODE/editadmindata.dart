import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetest/main.dart';
import 'package:firebasetest/NOT%20USED%20-%20EXTRA%20CODE/createuserscreen.dart';
import 'package:firebasetest/NOT%20USED%20-%20EXTRA%20CODE/editadmindata.dart';
import 'package:flutter/material.dart';

class EditAdminData extends StatefulWidget {
  @override
  _EditAdminData createState() => _EditAdminData();
}

class _EditAdminData extends State<EditAdminData> {
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

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  validator() {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print("Validated");
    } else {
      print("Not Validated");
    }
  }

  bool ableToEdit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          centerTitle: true,
          title: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text("Profile"),
          ),
          backgroundColor: Colors.redAccent[700],
        ),
        backgroundColor: Colors.orange[200],
        body: Container(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Please confirm your email first \nAfter confirming your email, you may edit your profile",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formkey,
                          child: TextFormField(
                            controller: emailController,
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
                            validator: (String? value) {
                              if (value == null || value.trim().length == 0) {
                                return "Email Required";
                              }
                              if (!RegExp(
                                      r"^([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)$")
                                  .hasMatch(value)) {
                                return "Please Enter valid email address";
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () async {
                        String userEmail = emailController.text.trim();
                        validator();

                        final QuerySnapshot snap = await FirebaseFirestore
                            .instance
                            .collection('users')
                            .where('email', isEqualTo: userEmail)
                            .get();
                        setState(() {
                          email = userEmail;
                          name = snap.docs[0]['name'];
                          phone = snap.docs[0]['phone'];

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
                                      builder: (context) => MyApp()));
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
                      'name : ' + name,
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
                  ]),
            ),
          ),
        ));
  }
}
