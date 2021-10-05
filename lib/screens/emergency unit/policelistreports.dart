import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetest/screens/emergency%20unit/reportoptiondialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class PoliceListReports extends StatefulWidget {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  _PoliceListReports createState() => _PoliceListReports();
}

class _PoliceListReports extends State<PoliceListReports> {
  @override
  Widget build(BuildContext context) {
    late String yourUid;
    return Scaffold(
        appBar: new AppBar(
          title: Text("Report Logs"),
          backgroundColor: Colors.redAccent[700],
        ),
        backgroundColor: Colors.orange[200],
        body: StreamBuilder<QuerySnapshot>(
          stream: widget._firestore.collection('police reports').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Text('Loading..');
            }
            return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  String itemTitle =
                      snapshot.data!.docs[index]['police message'];
                  return Slidable(
                      child: CardItem(itemTitle: itemTitle),
                      actionPane: SlidableDrawerActionPane(),

                      //left side
                      actions: <Widget>[
                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete_outline_rounded,
                          onTap: () async {
                            return await showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text("Confirm"),
                                  content: const Text(
                                      "Are you sure you wish to delete this report?"),
                                  actions: <Widget>[
                                    FlatButton(
                                        onPressed: () async {
                                          final QuerySnapshot snap =
                                              await FirebaseFirestore.instance
                                                  .collection('police reports')
                                                  .where('police message',
                                                      isEqualTo: itemTitle)
                                                  .get();
                                          setState(() {
                                            yourUid = snap.docs[0]['uid'];
                                          });
                                          FirebaseFirestore.instance
                                              .collection("police reports")
                                              .doc(yourUid)
                                              .delete();
                                          //Navigator.of(context).pop(true),
                                          Navigator.of(context).pop(true);
                                        },
                                        child: const Text("DELETE")),
                                    FlatButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(false),
                                      child: const Text("CANCEL"),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        )
                      ]);
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
      color: Colors.yellow[800],
      child: ListTile(
        title: Text(
          widget.itemTitle,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: () async {
          final action = await ReportOptionDialog.yesCancelDialog(
              context, 'Report', 'Would you like to view the Map?');
        },
        // onTap: () async {
        //   final QuerySnapshot snap = await FirebaseFirestore.instance
        //       .collection('hospital reports')
        //       .where('hospital message', isEqualTo: widget.itemTitle)
        //       .get();
        //   setState(() {
        //     yourUid = snap.docs[0]['uid'];
        //   });
        //   FirebaseFirestore.instance
        //       .collection("hospital message")
        //       .doc(yourUid)
        //       .delete();
        // },
      ),
    );
  }
}

















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

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebasetest/screens/emergency%20unit/reportoptiondialog.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart';

// class HospitalListReports extends StatefulWidget {
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   @override
//   _HospitalListReports createState() => _HospitalListReports();
// }

// class _HospitalListReports extends State<HospitalListReports> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         title: Text("Report Logs"),
//         backgroundColor: Colors.redAccent[700],
//       ),
//       backgroundColor: Colors.orange[200],
//       body: StreamBuilder<QuerySnapshot>(
//         stream: widget._firestore.collection('hospital reports').snapshots(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Text('Loading..');
//           }
//           return ListView.builder(
//             itemCount: snapshot.data!.docs.length,
//             itemBuilder: (context, index) {
//               final String itemTitle =
//                   snapshot.data!.docs[index]['hospital message'];
//               return Dismissible(
//                 direction: DismissDirection.endToStart,
//                 key: ObjectKey(itemTitle),
//                 background: buildSwipeActionLeft(),
//                 child: CardItem(itemTitle: itemTitle),
//                 onDismissed: (direction) async {
//                   return await showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: const Text("Confirm"),
//                         content: const Text(
//                             "Are you sure you wish to delete this item?"),
//                         actions: <Widget>[
//                           FlatButton(
//                               onPressed: () => Navigator.of(context).pop(true),
//                               child: const Text("DELETE")),
//                           FlatButton(
//                             onPressed: () => Navigator.of(context).pop(false),
//                             child: const Text("CANCEL"),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// Widget buildSwipeActionLeft() => Container(
//       alignment: Alignment.centerRight,
//       padding: EdgeInsets.symmetric(horizontal: 20),
//       color: Colors.redAccent,
//       child: Icon(
//         Icons.delete_forever,
//         color: Colors.white,
//         size: 32,
//       ),
//     );

// class CardItem extends StatefulWidget {
//   String itemTitle;
//   CardItem({required this.itemTitle});
//   @override
//   _CardItem createState() => _CardItem();
// }

// class _CardItem extends State<CardItem> {
//   bool isChecked = false;
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.redAccent[700],
//       child: ListTile(
//         title: Text(
//           widget.itemTitle,
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         onTap: () async {
//           final action = await ReportOptionDialog.yesCancelDialog(
//               context, 'Report', 'Would you like to view the Map?');
//         },
//         // onTap: () async {
//         //   final QuerySnapshot snap = await FirebaseFirestore.instance
//         //       .collection('hospital reports')
//         //       .where('hospital message', isEqualTo: widget.itemTitle)
//         //       .get();
//         //   setState(() {
//         //     yourUid = snap.docs[0]['uid'];
//         //   });
//         //   FirebaseFirestore.instance
//         //       .collection("hospital message")
//         //       .doc(yourUid)
//         //       .delete();
//         // },

//         // trailing: Checkbox(
//         //   value: isChecked,
//         //   onChanged: (bool) {
//         //     setState(() {
//         //       isChecked = !isChecked;
//         //     });
//         //   },
//         // ),
//       ),
//     );
//   }
// }












