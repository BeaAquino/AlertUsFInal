// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebasetest/screens/emergency%20unit/edituserdata.dart';
// import 'package:flutter/material.dart';
// import 'profile.dart';

// class ConfirmUser extends StatefulWidget {
//   @override
//   _ConfirmUser createState() => _ConfirmUser();
// }

// class _ConfirmUser extends State<ConfirmUser> {
//   TextEditingController emailController = new TextEditingController();
//   String email = " ";
//   String uid = " ";
//   String role = " ";
//   String password = " ";
//   String name = " ";
//   String phone = " ";
//   String police_message = " ";
//   String hospital_message = " ";
//   String fire_message = " ";
//   String longitude = " ";
//   String latitude = " ";

//   bool ableToEdit = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "Profile",
//           ),
//           backgroundColor: Colors.redAccent[700],
//         ),
//         backgroundColor: Colors.orange[200],
//         body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
//           SizedBox(
//             height: 10,
//           ),
//           Text(
//             "Please confirm your email first",
//             style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black),
//           ),
//           Text(
//             " after confirming your email, you may edit your profile",
//             style: TextStyle(
//                 fontSize: 15.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black),
//           ),
//           SizedBox(
//             height: 50,
//           ),
//           TextFormField(
//             controller: emailController,
//             validator: (val) =>
//                 val!.isNotEmpty ? null : "Please Enter E-mail Address",
//             decoration: InputDecoration(
//               border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8.0),
//                   borderSide: BorderSide.none),
//               fillColor: Colors.white,
//               filled: true,
//               hintText: "Email",
//               prefixIcon: Icon(
//                 Icons.email,
//                 color: Colors.grey[400],
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 10,
//           ),
//           GestureDetector(
//             onTap: () async {
//               String userEmail = emailController.text.trim();

//               final QuerySnapshot snap = await FirebaseFirestore.instance
//                   .collection('users')
//                   .where('email', isEqualTo: userEmail)
//                   .get();
//               setState(() {
//                 email = userEmail;
//                 uid = snap.docs[0]['uid'];
//                 role = snap.docs[0]['role'];
//                 name = snap.docs[0]['name'];
//                 phone = snap.docs[0]['phone'];
//                 police_message = snap.docs[0]['police message'];
//                 fire_message = snap.docs[0]['fire message'];
//                 hospital_message = snap.docs[0]['hospital message'];
//                 longitude = snap.docs[0]['longitude'];
//                 latitude = snap.docs[0]['latitude'];

//                 ableToEdit = true;
//               });
//             },
//             child: Container(
//               height: 50,
//               width: 130,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(50),
//                 color: Colors.redAccent[700],
//               ),
//               child: Center(
//                 child: Text("VIEW DATA",
//                     style: TextStyle(
//                       fontSize: 15,
//                       color: Colors.white,
//                     )),
//               ),
//             ),
//           ),
//           SizedBox(
//             height: 5,
//           ),
//           ableToEdit
//               ? GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                             builder: (context) => Profile(
//                                   uid: uid,
//                                 )));
//                   },
//                   child: Container(
//                     height: 50,
//                     width: 130,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(50),
//                       color: Colors.redAccent[700],
//                     ),
//                     child: Center(
//                       child: Text("Edit Profile",
//                           style: TextStyle(
//                             fontSize: 15,
//                             color: Colors.white,
//                           )),
//                     ),
//                   ),
//                 )
//               : Container(),
//           SizedBox(
//             height: 20,
//           ),
//           Text(
//             'User Data :',
//             style: TextStyle(
//                 fontSize: 30.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black),
//           ),
//           SizedBox(
//             height: 20,
//           ),
//           Text(
//             'Email : ' + email,
//             style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black),
//           ),
//           Text(
//             'Name : ' + name,
//             style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black),
//           ),
//           Text(
//             'Phone : ' + phone,
//             style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black),
//           ),
//           Text(
//             'longitude : ' + longitude,
//             style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black),
//           ),
//           Text(
//             'latitude : ' + latitude,
//             style: TextStyle(
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black),
//           ),
//         ]));
//   }
// }
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebasetest/screens/emergency%20unit/edituserdata.dart';
// import 'package:flutter/material.dart';
// import 'profile.dart';
// import 'profilesignup.dart';

// class ConfirmUserSignup extends StatefulWidget {
//   @override
//   _ConfirmUserSignup createState() => _ConfirmUserSignup();
// }

// class _ConfirmUserSignup extends State<ConfirmUserSignup> {
//   TextEditingController emailController = new TextEditingController();
//   String email = " ";
//   String uid = " ";
//   String role = " ";
//   String password = " ";
//   String name = " ";
//   String phone = " ";

//   //final _formkey = GlobalKey<FormState>();

//   final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

//   validator() {
//     if (_formkey.currentState != null && _formkey.currentState!.validate()) {
//       print("Validated");
//     } else {
//       print("Not Validated");
//     }
//   }

//   bool ableToEdit = false;
//   bool isValidForm = false;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           centerTitle: true,
//           title: FittedBox(
//             fit: BoxFit.fitWidth,
//             child: Text("Confirmation"),
//           ),
//           backgroundColor: Colors.redAccent[700],
//         ),
//         backgroundColor: Colors.orange[200],
//         body: Container(
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formkey,
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                       child: FittedBox(
//                         child: Text(
//                           "Please confirm your email first,\nAfter confirming your email, set Profile Data\n\nNote :\nif you have logged in previously kindly skip this confirmation and press confirm",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black),
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 50,
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(30.0),
//                       child: TextFormField(
//                         controller: emailController,
//                         decoration: InputDecoration(
//                           border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8.0),
//                               borderSide: BorderSide.none),
//                           fillColor: Colors.white,
//                           filled: true,
//                           hintText: "Email",
//                           prefixIcon: Icon(
//                             Icons.email,
//                             color: Colors.grey[400],
//                           ),
//                         ),
//                         validator: (String? value) {
//                           if (value == null || value.trim().length == 0) {
//                             return "Email Required";
//                           }
//                           if (!RegExp(
//                                   r"^([a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+(?:\.[a-zA-Z0-9!#$%&'*+\/=?^_`{|}~-]+)*@(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?)$")
//                               .hasMatch(value)) {
//                             return "Please Enter valid email address";
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     GestureDetector(
//                       onTap: () async {
//                         String userEmail = emailController.text.trim();
//                         validator();
//                         final QuerySnapshot snap = await FirebaseFirestore
//                             .instance
//                             .collection('users')
//                             .where('email', isEqualTo: userEmail)
//                             .get();
//                         setState(() {
//                           email = userEmail;
//                           uid = snap.docs[0]['uid'];
//                           role = snap.docs[0]['role'];
//                           name = snap.docs[0]['name'];
//                           phone = snap.docs[0]['phone'];

//                           ableToEdit = true;
//                           validator();
//                         });
//                       },
//                       child: Container(
//                         height: 50,
//                         width: 100,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(50),
//                           color: Colors.redAccent[700],
//                         ),
//                         child: Center(
//                           child: Text("Confirm",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 color: Colors.white,
//                               )),
//                         ),
//                       ),
//                     ),
//                     ableToEdit
//                         ? GestureDetector(
//                             onTap: () {
//                               validator();
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => ProfileSignUp(
//                                             uid: uid,
//                                           )));
//                             },
//                             child: Container(
//                               height: 50,
//                               width: 100,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50),
//                                 color: Colors.redAccent[700],
//                               ),
//                               child: Center(
//                                 child: Text("Set Profile",
//                                     style: TextStyle(
//                                       fontSize: 15,
//                                       color: Colors.white,
//                                     )),
//                               ),
//                             ),
//                           )
//                         : Container(),
//                     SizedBox(
//                       height: 20,
//                     ),
//                   ]),
//             ),
//           ),
//         ));
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetest/screens/emergency%20unit/edituserdata.dart';
import 'package:flutter/material.dart';
import 'profile.dart';
import 'profilesignup.dart';

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

  //final _formkey = GlobalKey<FormState>();

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
            child: Text("Confirmation"),
          ),
          backgroundColor: Colors.redAccent[700],
        ),
        backgroundColor: Colors.orange[200],
        body: Container(
            child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: FittedBox(
                    child: Text(
                      "Please confirm your email first,\nAfter confirming your email, you may edit your Profile",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
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
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                        return "Please Enter valid email address";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () async {
                    String userEmail = emailController.text.trim();
                    validator();
                    if (userEmail.isEmpty) {
                      validator();
                    } else {
                      final QuerySnapshot snap = await FirebaseFirestore
                          .instance
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
                    }
                  },
                  child: Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.redAccent[700],
                    ),
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
                          validator();
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
              ],
            ),
          ),
        )));
  }
}
