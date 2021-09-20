import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  @override
  _Report createState() => _Report();
}

class _Report extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Hospital Report",
        ),
        backgroundColor: Colors.redAccent[700],
      ),
      backgroundColor: Colors.orange[200],
    );
  }
}
