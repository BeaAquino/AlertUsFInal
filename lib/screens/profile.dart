import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetest/screens/homescreen.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  final String uid;

  Profile({Key key, this.uid}) : super(key: key);
  @override
  _Profile createState() => _Profile();
}

class _Profile extends State<Profile> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
                fillColor: Colors.white, filled: true, hintText: "Name..."),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: phoneController,
            decoration: InputDecoration(
                fillColor: Colors.white, filled: true, hintText: "Phone..."),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              String newName = nameController.text.trim();
              String newPhone = phoneController.text.trim();

              FirebaseFirestore.instance
                  .collection('users')
                  .doc(widget.uid)
                  .update({
                'name': newName,
                'phone': newPhone,
              });
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Container(
              height: 50,
              width: 200,
              color: Colors.redAccent[700],
              child: Center(
                child: Text(
                  "UPDATE PROFILE",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
