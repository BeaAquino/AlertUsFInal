// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:location/location.dart' as loc;
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:location/location.dart';

// const double CAMERA_ZOOM = 16;
// const double CAMERA_TILT = 80;
// const double CAMERA_BEARING = 30;

// class StationMap extends StatefulWidget {
//   String user_id;
//   // late String user_id = "eUoUNmJjUReiwcItj6ljzIFyiQg1";
//   StationMap(this.user_id);
//   @override
//   _StationMapState createState() => _StationMapState();
// }

// class _StationMapState extends State<StationMap> {
//   //final loc.Location location = loc.Location();

//   var llocation = new Location();
//   var userLocation;
//   late GoogleMapController _controller;
//   late BitmapDescriptor sourceIcon;
//   late BitmapDescriptor destinationIcon;
//   Set<Marker> _markers = Set<Marker>();
//   late LocationData currentLocation;
//   late LatLng destinationLocation;
//   Set<Polyline> _polylines = Set<Polyline>();
//   List<LatLng> polylineCoordinates = [];
//   late PolylinePoints polylinePoints;

//   bool _added = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: StreamBuilder(
//       stream: FirebaseFirestore.instance.collection('users').snapshots(),
//       builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (_added) {
//           StationMap(snapshot);
//         }
//         if (!snapshot.hasData) {
//           return Center(child: CircularProgressIndicator());
//         }
//         return GoogleMap(
//           mapType: MapType.normal,
//           polylines: _polylines,
//           markers: _markers,
//           initialCameraPosition: CameraPosition(
//               target: LatLng(0, 0),
//               zoom: CAMERA_ZOOM,
//               tilt: CAMERA_TILT,
//               bearing: CAMERA_BEARING),
//           onMapCreated: (GoogleMapController controller) async {
//             destinationLocation = LatLng(
//               snapshot.data!.docs.singleWhere(
//                   (element) => element.id == widget.user_id)['latitude'],
//               snapshot.data!.docs.singleWhere(
//                   (element) => element.id == widget.user_id)['longitude'],
//             );
//             showPinsOnMap();
//             setPolylines();

//             setState(
//               () {
//                 _controller = controller;
//                 _added = true;
//               },
//             );
//           },
//         );
//       },
//     ));
//   }

//   void setPolylines() async {
//     PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
//         "AIzaSyDmHM-IakxXdJqN59m-rYM-nBjQueCDam8",
//         PointLatLng(currentLocation.latitude, currentLocation.longitude),
//         PointLatLng(
//             destinationLocation.latitude, destinationLocation.longitude));
//     if (result.status == 'OK') {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//       setState(() {
//         _polylines.add(Polyline(
//             width: 10,
//             polylineId: PolylineId('Polyline'),
//             color: Color.fromARGB(255, 40, 122, 198),
//             points: polylineCoordinates));
//       });
//     }
//   }

//   void showPinsOnMap() {
//     setState(() {
//       var pinPosition =
//           LatLng(currentLocation.latitude, currentLocation.longitude);
//       _markers.add(Marker(
//           markerId: MarkerId('sourcePin'),
//           position: pinPosition,
//           icon: sourceIcon));
//       _markers.add(Marker(
//           markerId: MarkerId('destinationPin'),
//           position: destinationLocation,
//           icon: destinationIcon));
//     });
//   }

//   void initState() {
//     super.initState();
//     llocation = new Location();
//     polylinePoints = PolylinePoints();
//     llocation.onLocationChanged.listen((LocationData cLoc) {
//       currentLocation = cLoc;
//       updatePinOnMap();
//     });

//     setSourceAndDestinationLocationMarkerIcons();
//     setPolylines();
//   }

//   Future<void> StationMap(AsyncSnapshot<QuerySnapshot> snapshot) async {
//     await _controller.animateCamera(CameraUpdate.newCameraPosition(
//         CameraPosition(
//             target: LatLng(currentLocation.latitude, currentLocation.longitude),
//             zoom: 14.47)));
//   }

//   void setSourceAndDestinationLocationMarkerIcons() async {
//     sourceIcon = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration(devicePixelRatio: 2.0), 'assets/origin.png');
//     destinationIcon = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration(devicePixelRatio: 2.0), 'assets/destination.png');
//   }

//   void updatePinOnMap() async {
//     setState(() {
//       var pinPosition =
//           LatLng(currentLocation.latitude, currentLocation.longitude);
//       _markers.removeWhere((m) => m.markerId.value == 'sourcePin');
//       _markers.add(Marker(
//           markerId: MarkerId('sourcePin'),
//           position: pinPosition,
//           icon: sourceIcon));
//     });
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebasetest/map%20screens/hospitalscreen.dart';
import 'package:firebasetest/screens/emergency%20unit/reportoptiondialog.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:location/location.dart';

const double CAMERA_ZOOM = 16;
const double CAMERA_TILT = 80;
const double CAMERA_BEARING = 30;

class StationMap extends StatefulWidget {
  String user_id;
  // late String user_id = "eUoUNmJjUReiwcItj6ljzIFyiQg1";
  StationMap(this.user_id);
  @override
  _StationMapState createState() => _StationMapState();
}

class _StationMapState extends State<StationMap> {
  //final loc.Location location = loc.Location();

  var llocation = new Location();
  var userLocation;
  late GoogleMapController _controller;
  late BitmapDescriptor sourceIcon;
  late BitmapDescriptor destinationIcon;
  Set<Marker> _markers = Set<Marker>();
  late LocationData currentLocation;
  late LatLng destinationLocation;
  Set<Polyline> _polylines = Set<Polyline>();
  List<LatLng> polylineCoordinates = [];
  late PolylinePoints polylinePoints;
  late String user_name;
  late String user_number;

  bool _added = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Map",
          ),
          backgroundColor: Colors.redAccent[700],
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection('users').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (_added) {
              StationMap(snapshot);
            }
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            return Stack(
              children: [
                Positioned.fill(
                    child: GoogleMap(
                  mapType: MapType.normal,
                  polylines: _polylines,
                  markers: _markers,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(0, 0),
                      zoom: CAMERA_ZOOM,
                      tilt: CAMERA_TILT,
                      bearing: CAMERA_BEARING),
                  onMapCreated: (GoogleMapController controller) async {
                    destinationLocation = LatLng(
                      snapshot.data!.docs.singleWhere((element) =>
                          element.id == widget.user_id)['latitude'],
                      snapshot.data!.docs.singleWhere((element) =>
                          element.id == widget.user_id)['longitude'],
                    );
                    showPinsOnMap();
                    setPolylines();
                    collect();
                    setState(
                      () {
                        _controller = controller;
                        _added = true;
                      },
                    );
                  },
                )),
                Positioned(
                    left: 0,
                    right: 0,
                    bottom: 20,
                    child: MapDestBadge(
                      user_id: user_id,
                      user_name: user_name,
                      user_number: user_number,
                    ))
              ],
            );
          },
        ));
  }

  Future<void> collect() async {
    final QuerySnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .where('uid', isEqualTo: user_id)
        .get();
    user_name = snap.docs[0]['name'];
    user_number = snap.docs[0]['phone'];
  }

  void setPolylines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        "AIzaSyDmHM-IakxXdJqN59m-rYM-nBjQueCDam8",
        PointLatLng(currentLocation.latitude, currentLocation.longitude),
        PointLatLng(
            destinationLocation.latitude, destinationLocation.longitude));
    if (result.status == 'OK') {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
      setState(() {
        _polylines.add(Polyline(
            width: 10,
            polylineId: PolylineId('Polyline'),
            color: Color.fromARGB(255, 40, 122, 198),
            points: polylineCoordinates));
      });
    }
  }

  void showPinsOnMap() {
    setState(() {
      var pinPosition =
          LatLng(currentLocation.latitude, currentLocation.longitude);
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: pinPosition,
          icon: sourceIcon));
      _markers.add(Marker(
          markerId: MarkerId('destinationPin'),
          position: destinationLocation,
          icon: destinationIcon));
    });
  }

  void initState() {
    super.initState();
    llocation = new Location();
    polylinePoints = PolylinePoints();
    llocation.onLocationChanged.listen((LocationData cLoc) {
      currentLocation = cLoc;
      updatePinOnMap();
    });

    setSourceAndDestinationLocationMarkerIcons();
    setPolylines();
  }

  Future<void> StationMap(AsyncSnapshot<QuerySnapshot> snapshot) async {
    await _controller.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(
            target: LatLng(currentLocation.latitude, currentLocation.longitude),
            zoom: 14.47)));
  }

  void setSourceAndDestinationLocationMarkerIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0), 'assets/origin.png');
    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.0), 'assets/destination.png');
  }

  void updatePinOnMap() async {
    setState(() {
      var pinPosition =
          LatLng(currentLocation.latitude, currentLocation.longitude);
      _markers.removeWhere((m) => m.markerId.value == 'sourcePin');
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: pinPosition,
          icon: sourceIcon));
    });
  }
}

class MapDestBadge extends StatelessWidget {
  MapDestBadge({
    Key? key,
    required this.user_id,
    required this.user_name,
    required this.user_number,
  }) : super(key: key);
  final String user_id;
  final String user_name;
  final String user_number;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset.zero)
            ]),
        child: Row(
          children: [
            Stack(
              children: [
                ClipOval(
                  child: Icon(
                    Icons.person_pin,
                    size: 50.0,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user_name,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                  Text(user_number,
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 15)),
                ],
              ),
            ),
            Icon(Icons.location_pin, color: Colors.red, size: 50)
          ],
        ));
  }
}
