import 'package:flutter/material.dart';

class PoliceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Police Report",
          ),
          backgroundColor: Colors.redAccent[700],
        ),
        backgroundColor: Colors.orange[200],
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
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
              padding: const EdgeInsets.all(5.0),
              child: Center(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 5.0,
                  children: <Widget>[
                    SizedBox(
                      width: 173.0,
                      height: 110.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () {
                            print("Homicide Incident, Send Assistance.");
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.emoji_people_rounded,
                                  size: 50.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "HOMICIDE",
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
                      width: 173.0,
                      height: 110.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () {
                            print("Violence/Brawl Incident");
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.dangerous_rounded,
                                  size: 50.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "VIOLENCE/BRAWL",
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
                      width: 173.0,
                      height: 110.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                            onTap: () {
                              print("Report of Burglary/Theft.");
                            },
                            child: Center(
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: <Widget>[
                                      Icon(
                                        Icons.lock,
                                        size: 50.0,
                                        color: Colors.yellowAccent,
                                      ),
                                      SizedBox(
                                        height: 10.0,
                                      ),
                                      Text(
                                        "BURGLARY/THEFT",
                                        style: TextStyle(
                                            color: Colors.yellowAccent,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0),
                                      ),
                                    ],
                                  )),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 173.0,
                      height: 110.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () {
                            print("Domestic Threat Report.");
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.groups_rounded,
                                  size: 50.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "DOMESTIC THREAT",
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
                      width: 173.0,
                      height: 110.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () {
                            print("Sexual Assault Report");
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.priority_high_rounded,
                                  size: 50.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "SEXUAL ASSULT",
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
                      width: 173.0,
                      height: 110.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () {
                            print("Kidnapping/Missing Incident");
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.person_search_rounded,
                                  size: 50.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "MISSING/KIDNAPPING",
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0),
                                ),
                              ],
                            ),
                          )),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 173.0,
                      height: 110.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () {
                            print("Terrorist attack");
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.no_accounts_rounded,
                                  size: 50.0,
                                  color: Colors.yellowAccent,
                                ),
                                SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  "TERRORIST",
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
                      width: 173.0,
                      height: 110.0,
                      child: Card(
                        color: Colors.redAccent[700],
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: InkWell(
                          onTap: () {
                            print("In need of Police Assistance.");
                          },
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: <Widget>[
                                Icon(
                                  Icons.outbond_rounded,
                                  size: 50.0,
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
                                      fontSize: 16.0),
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
