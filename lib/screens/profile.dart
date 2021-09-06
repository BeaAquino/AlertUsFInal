// magkasama mga may // and different yung may ////
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebasetest/services/auth_services.dart';
// import 'package:provider/provider.dart';

// class Profile extends StatelessWidget {
//   TextEditingController nameController = new TextEditingController();
//   TextEditingController phoneController = new TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Create Profile",
//         ),
//         backgroundColor: Colors.redAccent[700],
//       ),
//       backgroundColor: Colors.orange[200],
//       body: Column(
//         children: [
//           TextFormField(
//             controller: nameController,
//             decoration: InputDecoration(
//                 fillColor: Colors.white,
//                 filled: true,
//                 prefixIcon: Icon(Icons.person),
//                 hintText: "Name"),
//           ),
//           TextFormField(
//             controller: phoneController,
//             decoration: InputDecoration(
//                 fillColor: Colors.white,
//                 filled: true,
//                 hintText: "Phone Number",
//                 prefixIcon: Icon(Icons.phone)),
//             maxLength: 11,
//           ),
//           Container(
//             height: 40,
//             width: MediaQuery.of(context).size.width / 3,
//             color: Colors.redAccent[700],
//             child: FlatButton(
//               onPressed: () {
//                 final String name = nameController.text.trim();
//                 final String phone = phoneController.text.trim();

//                 if (name.isEmpty) {
//                   print("Name is Empty");
//                 } else {
//                   if (phone.isEmpty) {
//                     print("Phone Number format e.g. 09323670109");
//                   } else {
//                     context
//                         .read<AuthService>()
//                         .login(
//                           name,
//                           phone,
//                         )
//                         .then((value) async {
//                       User user = FirebaseAuth.instance.currentUser;

//                       await FirebaseFirestore.instance
//                           .collection("users")
//                           .doc(user.uid)
//                           .set({'name': name, 'phone': phone});
//                     });
//                   }
//                 }
//               },
//               child: Text("SAVE",
//                   style: TextStyle(
//                     fontSize: 15,
//                     color: Colors.white,
//                   )),
//             ),
//           ),
// // old comment yung nasa baba
// //  SizedBox(
// //     width: 200.0,
// //     height: 50.0,
// //     child: Card(
// //         color: Colors.redAccent[700],
// //         elevation: 1.0,
// //         shape: RoundedRectangleBorder(
// //             borderRadius: BorderRadius.circular(8.0)),
// //         child: InkWell(
// //           onTap: () {},
// //           child: Center(
// //               child: Padding(
// //             padding: const EdgeInsets.all(1.0),
// //             child: Row(
// //               children: <Widget>[
// //                 Align(
// //                   alignment: Alignment.centerLeft,
// //                 ),
// //                 Align(
// //                   alignment: Alignment.center,
// //                   child: Text("              SAVE",
// //                       style: TextStyle(
// //                         fontSize: 20,
// //                         color: Colors.white,
// //                         fontWeight: FontWeight.bold,
// //                       )),
// //                 )
// //               ],
// //             ),
// //           )),
// //         )),
// //   )
//         ],
//       ),
//     );
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String uid;

  Profile({Key key, this.uid}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController numberController = new TextEditingController();
  TextEditingController nameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(hintText: "Name..."),
          ),
          TextFormField(
            controller: numberController,
            decoration: InputDecoration(hintText: "Number..."),
          ),
          GestureDetector(
            onTap: () async {
              String newName = nameController.text.trim();
              String newNumber = numberController.text.trim();

              FirebaseFirestore.instance
                  .collection('users')
                  .doc(widget.uid)
                  .update({
                'phone': newNumber,
                'name': newName,
              });
            },
            child: Container(
              height: 50,
              width: 100,
              color: Colors.blue,
              child: Center(
                child: Text(
                  "UPDATE DATA",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
