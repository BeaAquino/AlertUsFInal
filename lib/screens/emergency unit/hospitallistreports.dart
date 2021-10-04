// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';

// class HospitalListReports extends StatefulWidget {
//   @override
//   _HospitalListReports createState() => _HospitalListReports();
// }

// class _HospitalListReports extends State<HospitalListReports> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     var currentUser = FirebaseAuth.instance.currentUser;

//     return Scaffold(
//       appBar: new AppBar(
//         title: Text("Report Logs"),
//         backgroundColor: Colors.redAccent[700],
//       ),
//       backgroundColor: Colors.orange[200],
//       body: StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection('hospital reports')
//               .snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (!snapshot.hasData) {
//               return Center(
//                 child: CircularProgressIndicator(),
//               );
//             }

//             return ListView(
//               children: snapshot.data!.docs.map((document) {
//                 return Center(
//                   child: Container(
//                     color: Colors.white,
//                     width: MediaQuery.of(context).size.width / 1.2,
//                     height: MediaQuery.of(context).size.height / 6,
//                     child: Text("\n\nReport :" + document['hospital message']
//                         // +
//                         // "\nReport\n  Report Messages : " +
//                         // document['fire message'] +
//                         // "\n " +
//                         // document['police message'] +
//                         // "\n " +
//                         ),
//                   ),
//                 );
//               }).toList(),
//             );

//             ;
//           }),
//     );
//   }
// }

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetest/screens/emergency%20unit/reportoptiondialog.dart';
import 'package:flutter/material.dart';

class HospitalListReports extends StatefulWidget {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  _HospitalListReports createState() => _HospitalListReports();
}

class _HospitalListReports extends State<HospitalListReports> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: Text("Report Logs"),
          backgroundColor: Colors.redAccent[700],
        ),
        backgroundColor: Colors.orange[200],
        body: StreamBuilder<QuerySnapshot>(
          stream: widget._firestore.collection('hospital reports').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('Loading..');
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  String itemTitle =
                      snapshot.data!.docs[index]['hospital message'];
                  return CardItem(itemTitle: itemTitle);
                });
          },
        ));
  }
}

class CardItem extends StatefulWidget {
  String itemTitle;
  CardItem({required this.itemTitle});
  @override
  _CardItem createState() => _CardItem();
}

class _CardItem extends State<CardItem> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.redAccent[700],
      child: ListTile(
        title: Text(
          widget.itemTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: () async {
          final action = await ReportOptionDialog.yesCancelDialog(
              context, 'Report', 'Would you like to view the Map?');
        },
        // trailing: Checkbox(
        //   value: isChecked,
        //   onChanged: (bool) {
        //     isChecked = !isChecked;
        //   },
        // ),
      ),
    );
  }
}
