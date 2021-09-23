// ignore_for_file: dead_code

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebasetest/map%20screens/stationscreen.dart';
import 'package:firebasetest/screens/emergency%20unit/viewreport.dart';
import 'package:firebasetest/screens/user/homescreen.dart';
import 'package:firebasetest/screens/user/reportdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../../contact lists/contactus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetest/screens/user/confirmuser.dart';
import 'package:firebasetest/screens/user/mainscreen.dart';
import 'package:firebasetest/services/auth_services.dart';
import 'adminscreen.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';

final AuthService _auth = AuthService(FirebaseAuth.instance);

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
  print(message.data);
  flutterLocalNotificationsPlugin.show(
      message.data.hashCode,
      message.data['title'],
      message.data['body'],
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channel.description,
        ),
      ));
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  'This channel is used for important notifications.', // description
  importance: Importance.high,
);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future doSomething(context) async {
  runApp(
      Another()); // yung class ng Another, icopy paste nalang yung code ng map
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String token;
  List subscribed = [];
  List topics = ['Police', 'Hospital', 'Fire'];
  @override
  void initState() {
    super.initState();
    var initialzationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings = InitializationSettings(
      android: initialzationSettingsAndroid,
    );

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: doSomething);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                channel.description,
                icon: android.smallIcon,
              ),
            ));
      }
    });
    getToken();
    getTopics();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Subscription"),
        backgroundColor: Colors.redAccent[700],
      ),
      backgroundColor: Colors.orange[200],
      drawer: new Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: new Text(
                "Welcome",
                style:
                    new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
              ),
              accountEmail: new Text("to AlertUs "),
              decoration: new BoxDecoration(color: Colors.redAccent[700]),
            ),
            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConfirmUser(),
                    ));
              },
              title: Text("Profile"),
            ),
            ListTile(
              leading: Icon(
                Icons.info,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ContactUs()),
                );
              },
              title: Text("About Us"),
            ),
            ListTile(
              leading: Icon(
                Icons.logout_rounded,
                color: Colors.black,
              ),
              onTap: () async {
                await _auth.signOut();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    ));
              },
              title: Text("Log Out"),
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: topics.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(topics[index]),
          trailing: subscribed.contains(topics[index])
              ? ElevatedButton(
                  onPressed: () async {
                    await FirebaseMessaging.instance
                        .unsubscribeFromTopic(topics[index]);
                    await FirebaseFirestore.instance
                        .collection('topics')
                        .doc(token)
                        .update({topics[index]: FieldValue.delete()});
                    setState(() {
                      subscribed.remove(topics[index]);
                    });
                  },
                  child: Text('unsubscribe'),
                )
              : ElevatedButton(
                  onPressed: () async {
                    await FirebaseMessaging.instance
                        .subscribeToTopic(topics[index]);

                    await FirebaseFirestore.instance
                        .collection('topics')
                        .doc(token)
                        .set({topics[index]: 'subscribe'},
                            SetOptions(merge: true));
                    setState(() {
                      subscribed.add(topics[index]);
                    });
                  },
                  child: Text('subscribe')),
        ),
      ),
    );
  }

  getToken() async {
    token = await FirebaseMessaging.instance.getToken();
    setState(() {
      token = token;
    });
    print(token);
  }

  getTopics() async {
    await FirebaseFirestore.instance
        .collection('topics')
        .get()
        .then((value) => value.docs.forEach((element) {
              if (token == element.id) {
                subscribed = element.data().keys.toList();
              }
            }));

    setState(() {
      subscribed = subscribed;
    });
  }
}

class Another extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Display(),
    );
  }
}

class Display extends StatefulWidget {
  @override
  _Display createState() => _Display();
}

class _Display extends State<Display> {
  @override
  void initState() {
    super.initState();
  }

  late String uid;
  late String email;
  late String name;
  late String phone;
  // late String longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        // title: Text("Dashboard"),
        backgroundColor: Colors.redAccent[700],
      ),
      backgroundColor: Colors.orange[200],
      body: SafeArea(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              "\t\t\t\t\t\t View Reporter?",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.start,
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                  child: Wrap(spacing: 10, runSpacing: 5.0, children: <Widget>[
                SizedBox(
                  width: 175.0,
                  height: 160.0,
                  child: Card(
                    color: Colors.redAccent[700],
                    elevation: 2.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0)),
                    child: InkWell(
                      onTap: () async {
                        var currentUser = FirebaseAuth.instance.currentUser;
                        if (currentUser != null) {
                          final QuerySnapshot snap = await FirebaseFirestore
                              .instance
                              .collection('users')
                              .where('latitude', isNotEqualTo: 0)
                              .get();
                          setState(() {
                            uid = snap.docs[0]['uid'];
                            email = snap.docs[0]['email'];
                            name = snap.docs[0]['name'];
                            phone = snap.docs[0]['phone'];
                            // longitude = snap.docs[0]['longitude'];
                            // latitude = snap.docs[0]['latitude'];
                          });
                          final action = await ViewAlertDialogs.yesCancelDialog(
                              uid,
                              context,
                              'View Report',
                              '\nReport by:' +
                                  '\nuid: ' +
                                  uid +
                                  '\n\nemail:' +
                                  email +
                                  '\nname : ' +
                                  name +
                                  '\nphone number : ' +
                                  phone);
                        }
                        Center(
                            child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Icon(
                                Icons.add_alert,
                                size: 90.0,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 10.0,
                              ),
                              Text(
                                "Accept",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ],
                          ),
                        ));
                      },
                    ),
                  ),
                ),
              ])))
        ]),
      ),
    );
  }
}


// // // // // const double CAMERA_ZOOM = 16;
// // // // // const double CAMERA_TILT = 80;
// // // // // const double CAMERA_BEARING = 30;

// // // // // class StationMap extends StatefulWidget {
// // // // //   final String user_id = "8MlTydvFLsRpskI4LDz8bt9HJl13"; //dito pala dapat di naka set yung uid noh
// // // // //   @override
// // // // //   _StationMapState createState() => _StationMapState();
// // // // // }

// // // // // class _StationMapState extends State<StationMap> {
// // // // //   _StationMapState();
// // // // //   var llocation = new Location();
// // // // //   var userLocation;
// // // // //   late GoogleMapController _controller;
// // // // //   late BitmapDescriptor sourceIcon;
// // // // //   late BitmapDescriptor destinationIcon;
// // // // //   Set<Marker> _markers = Set<Marker>();
// // // // //   late LocationData currentLocation;
// // // // //   late LatLng destinationLocation;
// // // // //   Set<Polyline> _polylines = Set<Polyline>();
// // // // //   List<LatLng> polylineCoordinates = [];
// // // // //   late PolylinePoints polylinePoints;

// // // // //   bool _added = false;
// // // // //   @override
// // // // //   Widget build(BuildContext context) {
// // // // //     return Scaffold(
// // // // //         body: StreamBuilder(
// // // // //       stream: FirebaseFirestore.instance.collection('users').snapshots(),
// // // // //       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
// // // // //         if (_added) {
// // // // //           StationMap(snapshot);
// // // // //         }
// // // // //         if (!snapshot.hasData) {
// // // // //           return Center(child: CircularProgressIndicator());
// // // // //         }
// // // // //         return GoogleMap(
// // // // //           mapType: MapType.normal,
// // // // //           polylines: _polylines,
// // // // //           markers: _markers,
// // // // //           initialCameraPosition: CameraPosition(
// // // // //               target: LatLng(0, 0),
// // // // //               zoom: CAMERA_ZOOM,
// // // // //               tilt: CAMERA_TILT,
// // // // //               bearing: CAMERA_BEARING),
// // // // //           onMapCreated: (GoogleMapController controller) async {
// // // // //             destinationLocation = LatLng(
// // // // //               snapshot.data!.docs.singleWhere(
// // // // //                   (element) => element.id == widget.user_id)['latitude'],
// // // // //               snapshot.data!.docs.singleWhere(
// // // // //                   (element) => element.id == widget.user_id)['longitude'],
// // // // //             );
// // // // //             showPinsOnMap();
// // // // //             setPolylines();

// // // // //             setState(
// // // // //               () {
// // // // //                 _controller = controller;
// // // // //                 _added = true;
// // // // //               },
// // // // //             );
// // // // //           },
// // // // //         );
// // // // //       },
// // // // //     ));
// // // // //   }

// // // // //   void setPolylines() async {
// // // // //     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
// // // // //         "AIzaSyDmHM-IakxXdJqN59m-rYM-nBjQueCDam8",
// // // // //         PointLatLng(currentLocation.latitude, currentLocation.longitude),
// // // // //         PointLatLng(
// // // // //             destinationLocation.latitude, destinationLocation.longitude));
// // // // //     if (result.status == 'OK') {
// // // // //       result.points.forEach((PointLatLng point) {
// // // // //         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
// // // // //       });
// // // // //       setState(() {
// // // // //         _polylines.add(Polyline(
// // // // //             width: 10,
// // // // //             polylineId: PolylineId('Polyline'),
// // // // //             color: Color.fromARGB(255, 40, 122, 198),
// // // // //             points: polylineCoordinates));
// // // // //       });
// // // // //     }
// // // // //   }

// // // // //   void showPinsOnMap() {
// // // // //     setState(() {
// // // // //       var pinPosition =
// // // // //           LatLng(currentLocation.latitude, currentLocation.longitude);
// // // // //       _markers.add(Marker(
// // // // //           markerId: MarkerId('sourcePin'),
// // // // //           position: pinPosition,
// // // // //           icon: sourceIcon));
// // // // //       _markers.add(Marker(
// // // // //           markerId: MarkerId('destinationPin'),
// // // // //           position: destinationLocation,
// // // // //           icon: destinationIcon));
// // // // //     });
// // // // //   }

// // // // //   void initState() {
// // // // //     super.initState();
// // // // //     llocation = new Location();
// // // // //     polylinePoints = PolylinePoints();
// // // // //     llocation.onLocationChanged.listen((LocationData cLoc) {
// // // // //       currentLocation = cLoc;
// // // // //       updatePinOnMap();
// // // // //     });

// // // // //     setSourceAndDestinationLocationMarkerIcons();
// // // // //     setPolylines();
// // // // //   }

// // // // //   Future<void> StationMap(AsyncSnapshot<QuerySnapshot> snapshot) async {
// // // // //     await _controller
// // // // //         .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
// // // // //             target: LatLng(
// // // // //               snapshot.data!.docs.singleWhere(
// // // // //                   (element) => element.id == widget.user_id)['latitude'],
// // // // //               snapshot.data!.docs.singleWhere(
// // // // //                   (element) => element.id == widget.user_id)['longitude'],
// // // // //             ),
// // // // //             zoom: 14.47)));
// // // // //   }

// // // // //   void setSourceAndDestinationLocationMarkerIcons() async {
// // // // //     sourceIcon = await BitmapDescriptor.fromAssetImage(
// // // // //         ImageConfiguration(devicePixelRatio: 2.0), 'assets/origin.png');
// // // // //     destinationIcon = await BitmapDescriptor.fromAssetImage(
// // // // //         ImageConfiguration(devicePixelRatio: 2.0), 'assets/destination.png');
// // // // //   }

// // // // //   void updatePinOnMap() async {
// // // // //     setState(() {
// // // // //       var pinPosition =
// // // // //           LatLng(currentLocation.latitude, currentLocation.longitude);
// // // // //       _markers.removeWhere((m) => m.markerId.value == 'sourcePin');
// // // // //       _markers.add(Marker(
// // // // //           markerId: MarkerId('sourcePin'),
// // // // //           position: pinPosition,
// // // // //           icon: sourceIcon));
// // // // //     });
// // // // //   }
// // // // // }


// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:firebasetest/screens/user/homescreen.dart';
// import 'package:firebasetest/screens/user/reportdialog.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import '../../contact lists/contactus.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebasetest/screens/user/confirmuser.dart';
// import 'package:firebasetest/screens/user/mainscreen.dart';
// import 'package:firebasetest/services/auth_services.dart';
// import 'adminscreen.dart';

// final AuthService _auth = AuthService(FirebaseAuth.instance);

// Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('Handling a background message ${message.messageId}');
//   print(message.data);
//   flutterLocalNotificationsPlugin.show(
//       message.data.hashCode,
//       message.data['title'],
//       message.data['body'],
//       NotificationDetails(
//         android: AndroidNotificationDetails(
//           channel.id,
//           channel.name,
//           channel.description,
//         ),
//       ));
// }

// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'high_importance_channel', // id
//   'High Importance Notifications', // title
//   'This channel is used for important notifications.', // description
//   importance: Importance.high,
// );

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();

// Future doSomething(context) async {
//   runApp(
//       Another()); // yung class ng Another, icopy paste nalang yung code ng map
// }

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();

//   FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<
//           AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);

//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   late String token;
//   List subscribed = [];
//   List topics = ['Police', 'Hospital', 'Fire'];
//   @override
//   void initState() {
//     super.initState();
//     var initialzationSettingsAndroid =
//         AndroidInitializationSettings('@mipmap/ic_launcher');
//     var initializationSettings = InitializationSettings(
//       android: initialzationSettingsAndroid,
//     );

//     flutterLocalNotificationsPlugin.initialize(initializationSettings,
//         onSelectNotification: doSomething);
//     FirebaseMessaging.onMessage.listen((RemoteMessage message) {
//       RemoteNotification notification = message.notification;
//       AndroidNotification? android = message.notification?.android;
//       if (notification != null && android != null) {
//         flutterLocalNotificationsPlugin.show(
//             notification.hashCode,
//             notification.title,
//             notification.body,
//             NotificationDetails(
//               android: AndroidNotificationDetails(
//                 channel.id,
//                 channel.name,
//                 channel.description,
//                 icon: android.smallIcon,
//               ),
//             ));
//       }
//     });
//     getToken();
//     getTopics();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new AppBar(
//         title: Text("Subscription"),
//         backgroundColor: Colors.redAccent[700],
//       ),
//       backgroundColor: Colors.orange[200],
//       drawer: new Drawer(
//         child: ListView(
//           children: <Widget>[
//             UserAccountsDrawerHeader(
//               accountName: new Text(
//                 "Welcome",
//                 style:
//                     new TextStyle(fontWeight: FontWeight.bold, fontSize: 17.0),
//               ),
//               accountEmail: new Text("to AlertUs "),
//               decoration: new BoxDecoration(color: Colors.redAccent[700]),
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.person,
//                 color: Colors.black,
//               ),
//               onTap: () {
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ConfirmUser(),
//                     ));
//               },
//               title: Text("Profile"),
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.info,
//                 color: Colors.black,
//               ),
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => ContactUs()),
//                 );
//               },
//               title: Text("About Us"),
//             ),
//             ListTile(
//               leading: Icon(
//                 Icons.logout_rounded,
//                 color: Colors.black,
//               ),
//               onTap: () async {
//                 await _auth.signOut();
//                 Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => MainScreen(),
//                     ));
//               },
//               title: Text("Log Out"),
//             ),
//           ],
//         ),
//       ),
//       body: ListView.builder(
//         itemCount: topics.length,
//         itemBuilder: (context, index) => ListTile(
//           title: Text(topics[index]),
//           trailing: subscribed.contains(topics[index])
//               ? ElevatedButton(
//                   onPressed: () async {
//                     await FirebaseMessaging.instance
//                         .unsubscribeFromTopic(topics[index]);
//                     await FirebaseFirestore.instance
//                         .collection('topics')
//                         .doc(token)
//                         .update({topics[index]: FieldValue.delete()});
//                     setState(() {
//                       subscribed.remove(topics[index]);
//                     });
//                   },
//                   child: Text('unsubscribe'),
//                 )
//               : ElevatedButton(
//                   onPressed: () async {
//                     await FirebaseMessaging.instance
//                         .subscribeToTopic(topics[index]);

//                     await FirebaseFirestore.instance
//                         .collection('topics')
//                         .doc(token)
//                         .set({topics[index]: 'subscribe'},
//                             SetOptions(merge: true));
//                     setState(() {
//                       subscribed.add(topics[index]);
//                     });
//                   },
//                   child: Text('subscribe')),
//         ),
//       ),
//     );
//   }

//   getToken() async {
//     token = await FirebaseMessaging.instance.getToken();
//     setState(() {
//       token = token;
//     });
//     print(token);
//   }

//   getTopics() async {
//     await FirebaseFirestore.instance
//         .collection('topics')
//         .get()
//         .then((value) => value.docs.forEach((element) {
//               if (token == element.id) {
//                 subscribed = element.data().keys.toList();
//               }
//             }));

//     setState(() {
//       subscribed = subscribed;
//     });
//   }
// }

// class Another extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: Report(),
//     );
//   }
// }

// class Report extends StatefulWidget {
//   Report();
//   @override
//   _Report createState() => _Report();
// }

// class _Report extends State<Report> {
//   _Report();
//   @override
//   Widget build(BuildContext context) {
//     var currentUser = "user";
//     var _police = FirebaseFirestore.instance
//         .collection('users')
//         .doc('police message')
//         .get();

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "List of Users",
//         ),
//         backgroundColor: Colors.redAccent[700],
//       ),
//       backgroundColor: Colors.orange[200],
//       floatingActionButton: null,
//       body: StreamBuilder(
//           stream: FirebaseFirestore.instance
//               .collection('users')
//               .where('role', isEqualTo: currentUser)
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
//                     width: MediaQuery.of(context).size.width / 1.2,
//                     height: MediaQuery.of(context).size.height / 6,
//                     child: Text("\n\nName :" +
//                             document['name'] +
//                             "\nPhone : " +
//                             document['phone'] +
//                             "\nEmail : " +
//                             document['email'] +
//                             "\nPolice Report: " +
//                             document['police report']
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
