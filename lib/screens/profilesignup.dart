import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetest/screens/homescreen.dart';
import 'package:flutter/material.dart';

class ProfileSignUp extends StatefulWidget {
  final String uid;

  ProfileSignUp({Key key, this.uid}) : super(key: key);
  @override
  _ProfileSignUp createState() => _ProfileSignUp();
}

class _ProfileSignUp extends State<ProfileSignUp> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Profile Setup",
        ),
        backgroundColor: Colors.redAccent[700],
      ),
      backgroundColor: Colors.orange[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            "Please fill in the form below\n these data will be sent to emergency units\n you may update your profile in the application",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
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
                  "SET PROFILE",
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
