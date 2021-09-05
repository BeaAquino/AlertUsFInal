import 'package:flutter/material.dart';

class HospitalScreen extends StatelessWidget {
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
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "WHAT HAS HAPPENED?",
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
                child: Wrap(
                  spacing: 10,
                  runSpacing: 5.0,
                  children: <Widget>[
                    SizedBox(
                      width: 175.0,
                      height: 160.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () {
                            print("Injury Accident occurred");
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.personal_injury_rounded,
                                  size: 90.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "INJURY ACCIDENTS",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 175.0,
                      height: 160.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () {
                            print("In need of Emergency Doctor.");
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.medical_services_rounded,
                                  size: 90.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "EMERGENCY DOCTOR",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 175.0,
                      height: 160.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                            onTap: () {
                              print("In need of Midwifery Assistance ASAP");
                            },
                            child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.pregnant_woman_rounded,
                                        size: 90.0,
                                        color: Colors.yellowAccent,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "MIDWIFERY",
                                        style: TextStyle(
                                            color: Colors.yellowAccent,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0),
                                      ),
                                    ],
                                  )),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 175.0,
                      height: 160.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () {
                            print("In need of Medical Assistance");
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.outbond_rounded,
                                  size: 90.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "OTHERS",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    // SizedBox(
                    //   width: 360.0,
                    //   height: 70.0,
                    //   child: Card(
                    //       color: Colors.redAccent[700],
                    //       elevation: 1.0,
                    //       shape: RoundedRectangleBorder(
                    //           borderRadius: BorderRadius.circular(8.0)),
                    //       child: InkWell(
                    //         onTap: () {},
                    //         child: Center(
                    //             child: Padding(
                    //           padding: const EdgeInsets.all(1.0),
                    //           child: Row(
                    //             children: <Widget>[
                    //               Align(
                    //                 alignment: Alignment.center,
                    //                 child: Text(
                    //                     "                              SEND ",
                    //                     style: TextStyle(
                    //                       fontSize: 20,
                    //                       color: Colors.white,
                    //                       fontWeight: FontWeight.bold,
                    //                     )),
                    //               )
                    //             ],
                    //           ),
                    //         )),
                    //       )),
                    // ),
                  ],
                ),
              ),
            )
          ],
        )));
  }
}
