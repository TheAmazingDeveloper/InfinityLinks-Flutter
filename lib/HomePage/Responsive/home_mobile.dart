// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinitylinks/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  late Constants constants;

  @override
  Widget build(BuildContext context) {
    constants = Constants(context);
    return Scaffold(
      body: Container(
        height: constants.height,
        width: constants.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/background.webp'),
              fit: BoxFit.cover),
        ),
        child: Column(
          children: [
            displayPic(constants),
            SizedBox(
              height: constants.height / 35,
            ),
            displayName(constants),
            buildCarouselCard(constants, context)
          ],
        ),
      ),
    );
  }
}

Widget displayPic(Constants constants) {
  return Padding(
    padding: EdgeInsets.only(top: constants.height / 20),
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.black),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: const [
            BoxShadow(
              offset: Offset(-10, 10),
              color: Colors.red,
              blurRadius: 15,
              spreadRadius: -10,
            ),
            BoxShadow(
              offset: Offset(-10, -10),
              color: Colors.orange,
              blurRadius: 15,
              spreadRadius: -10,
            ),
            BoxShadow(
              offset: Offset(10, -10),
              color: Colors.blue,
              blurRadius: 15,
              spreadRadius: -10,
            ),
            BoxShadow(
              offset: Offset(10, 10),
              color: Colors.deepPurple,
              blurRadius: 15,
              spreadRadius: -10,
            )
          ],
        ),
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/images/profile.png'),
          radius: constants.width / 7,
        ),
      ),
    ),
  );
}

Widget displayName(Constants constants) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.black, borderRadius: BorderRadius.circular(25)),
    height: constants.height / 16,
    width: constants.width / 1.05,
    padding: EdgeInsets.only(bottom: 3),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
            onTap: () {
              launchUrl(
                Uri.parse(Constants.instagramLink),
              );
            },
            child: FaIcon(
              FontAwesomeIcons.instagram,
              color: Colors.white,
              size: 28,
            )),
        SizedBox(
          width: constants.width / 40,
        ),
        Text(
          "Amazing Developer",
          style:
              TextStyle(color: Colors.white, fontSize: 28, letterSpacing: 1.5),
        ),
        SizedBox(
          width: constants.width / 40,
        ),
        InkWell(
            onTap: () {
              launchUrl(
                Uri.parse(Constants.githubLink),
              );
            },
            child: FaIcon(
              FontAwesomeIcons.github,
              color: Colors.white,
              size: 28,
            ))
      ],
    ),
  );
}

Widget buildCarouselCard(Constants constants, BuildContext context) {
  List languages = ["Flutter"];
  List month = [
    "Jan",
    "Feb",
    "Mar",
    "Apr",
    "May",
    "Jun",
    "Jul",
    "Aug",
    "Sep",
    "Oct",
    "Nov",
    "Dec"
  ];
  return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
          height: constants.height / 1.98,
          width: constants.width / 1,
          child: ListView.builder(
              itemCount: languages.length,
              itemBuilder: (context, i) {
                return Container(
                    height: constants.height / 1.99,
                    width: constants.width / 1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Stack(children: [
                      Positioned(
                        top: 0,
                        left: 5,
                        child: Container(
                          width: constants.width / 4,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.rectangle,
                              borderRadius: BorderRadius.circular(25)),
                          padding: EdgeInsets.only(left: 8),
                          child: Text(
                            languages[i],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1.2),
                          ),
                        ),
                      ),
                      Positioned(
                        height: constants.height / 2.28,
                        width: constants.width / 1,
                        top: 40,
                        child: ScrollConfiguration(
                            behavior: ScrollConfiguration.of(context).copyWith(
                                dragDevices: {
                                  PointerDeviceKind.mouse,
                                  PointerDeviceKind.touch,
                                  PointerDeviceKind.trackpad
                                }),
                            child: StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection(
                                        languages[i].toString().toLowerCase())
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  var docs = snapshot.data?.docs;
                                  if (snapshot.data != null) {
                                    return ListView.builder(
                                      itemCount: docs?.length,
                                      scrollDirection: Axis.horizontal,
                                      shrinkWrap: true,
                                      physics: BouncingScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        var data = docs![index].data();
                                        Timestamp timestamp =
                                            data['publishedOn'];
                                        var dateTime =
                                            DateTime.fromMillisecondsSinceEpoch(
                                                timestamp
                                                    .toDate()
                                                    .millisecondsSinceEpoch);
                                        String publishedOn =
                                            "${dateTime.day} ${month[dateTime.month.toInt() - 1]} ${dateTime.year}";
                                        return Padding(
                                          padding: EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Container(
                                            width: constants.width / 1.5,
                                            decoration: BoxDecoration(
                                                color: Colors.black,
                                                shape: BoxShape.rectangle,
                                                borderRadius:
                                                    BorderRadius.circular(25)),
                                            padding: EdgeInsets.all(4),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  shape: BoxShape.rectangle,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          25)),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(5, 5, 5, 0),
                                                    child: Container(
                                                      height:
                                                          constants.height / 6,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                            image: NetworkImage(
                                                                data[
                                                                    'imageUrl']),
                                                            fit: BoxFit.fill),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(20),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5, 4, 5, 0),
                                                    child: Text(
                                                      data['title'],
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 20),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5, 4, 5, 0),
                                                    child: Text(
                                                      data['shortDesc'],
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          letterSpacing: 0),
                                                      maxLines: 3,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.fromLTRB(
                                                            5, 5, 5, 0),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              border: Border.all(
                                                                  color: Colors
                                                                      .teal
                                                                      .shade800,
                                                                  width: 2),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          50)),
                                                          child: TextButton(
                                                            onPressed: () {},
                                                            onHover: (hover) {},
                                                            child: Text(
                                                              "Learn More",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              color: Colors.teal
                                                                  .shade800,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          25)),
                                                          child: TextButton(
                                                            onPressed: () {
                                                              launchUrl(
                                                                  Uri.parse(data[
                                                                      'projectUrl']),
                                                                  webOnlyWindowName:
                                                                      "_blank");
                                                            },
                                                            onHover: (hover) {},
                                                            child: Text(
                                                              "Visit",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 10, top: 3),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment.end,
                                                      children: [
                                                        Text(
                                                          publishedOn,
                                                          style: TextStyle(
                                                              color: Colors.grey
                                                                  .shade600),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  } else {
                                    return Text("data");
                                  }
                                })),
                      )
                    ]));
              })));
}
