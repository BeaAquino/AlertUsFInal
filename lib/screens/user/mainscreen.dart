import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetest/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  //final _formkey = GlobalKey<FormState>();
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  validator() {
    if (_formkey.currentState != null && _formkey.currentState!.validate()) {
      print("Validated");
    } else {
      print("Not Validated");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.orange[200],
      body: Container(
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 20.0),
                Container(
                  height: 250,
                  child: Image(
                    image: AssetImage("images/AlertUs.png"),
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 20),
                RichText(
                    text: TextSpan(
                        text: 'Welcome to ',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                        children: <TextSpan>[
                      TextSpan(
                          text: 'AlertUs',
                          style: TextStyle(
                              fontSize: 30.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.red[900]))
                    ])),
                SizedBox(height: 10.0),
                Text(
                  'An Emergency Assistance Application\n',
                  style: TextStyle(color: Colors.black),
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "E-Mail...",
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
                SizedBox(height: 16),
                Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 50,
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Password...",
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.grey[400],
                      ),
                    ),
                    obscureText: true,
                    validator: (String? value) {
                      if (value == null || value.trim().length == 0) {
                        return "Password is required";
                      }
                      if (value.length <= 6) {
                        return "Password should not be less than 8 characters";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(height: 16),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.redAccent[700],
                  ),
                  child: FlatButton(
                    onPressed: () {
                      final String email = emailController.text.trim();
                      final String password = passwordController.text.trim();
                      validator();

                      if (email.isEmpty) {
                        print("Email is Empty");
                      } else {
                        if (password.isEmpty) {
                          print("Password is Empty");
                        } else {
                          context.read<AuthService>().login(
                                email,
                                password,
                              );
                        }
                      }
                    },
                    child: Text("Log In",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        )),
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.redAccent[700],
                  ),
                  child: FlatButton(
                    onPressed: () {
                      final String email = emailController.text.trim();
                      final String password = passwordController.text.trim();
                      validator();

                      if (email.isEmpty) {
                        print("Email is Empty");
                      } else {
                        if (password.isEmpty) {
                          print("Password is Empty");
                        } else {
                          context
                              .read<AuthService>()
                              .signUp(
                                email,
                                password,
                                "user",
                              )
                              .then((value) async {
                            User user = FirebaseAuth.instance.currentUser;

                            await FirebaseFirestore.instance
                                .collection("users")
                                .doc(user.uid)
                                .set({
                              'uid': user.uid,
                              'email': email,
                              'password': password,
                              'role': 'user',
                              'name': 'Name',
                              'phone': '00000000000',
                              'police message': '',
                              'hospital message': '',
                              'fire message': '',
                              'longitude': 0,
                              'latitude': 0,
                            });
                          });
                        }
                      }
                    },
                    child: Text("Sign Up",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        )),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String? validatorText(String formText) {
  if (formText.isEmpty) return 'Please Enter E-Mail...';

  return null;
}
