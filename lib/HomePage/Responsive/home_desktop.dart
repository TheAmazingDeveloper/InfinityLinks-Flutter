// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinitylinks/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeDesktop extends StatefulWidget {
  const HomeDesktop({super.key});

  @override
  State<HomeDesktop> createState() => _HomeDesktopState();
}

class _HomeDesktopState extends State<HomeDesktop> {
  late Constants constants;

  List languages = ["flutter", "", "", ""];

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
              fit: BoxFit.fill),
        ),
        child: Column(
          children: [
            displayPic(constants),
            SizedBox(
              height: constants.height / 35,
            ),
            displayName(constants),
            SizedBox(
              height: constants.height / 35,
            ),
            buildCarouselCard(constants, context)
          ],
        ),
      ),
    );
  }
}

Widget displayPic(Constants constants) {
  return Padding(
    padding: EdgeInsets.only(top: constants.height / 50),
    child: Container(
      padding: const EdgeInsets.all(20),
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
          radius: constants.width / 23,
        ),
      ),
    ),
  );
}

Widget displayName(Constants constants) {
  ValueNotifier ishoveringinsta = ValueNotifier(false);
  ValueNotifier ishoveringgit = ValueNotifier(false);
  return Container(
    decoration: BoxDecoration(
        color: Colors.black, borderRadius: BorderRadius.circular(25)),
    height: constants.height / 13.1,
    width: constants.width / 2.8,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () {
                launchUrl(Uri.parse(Constants.instagramLink),
                    webOnlyWindowName: "_blank");
              },
              onHover: (value) {
                ishoveringinsta.value = !ishoveringinsta.value;
              },
              child: ValueListenableBuilder(
                valueListenable: ishoveringinsta,
                builder: (context, value, child) {
                  return ishoveringinsta.value == false
                      ? FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors.white,
                          size: 32,
                        )
                      : AnimatedContainer(
                          duration: Duration(seconds: 2),
                          child: Image.asset(
                            'assets/images/instaIcon.png',
                            height: 32,
                            width: 32,
                          ));
                },
              ),
            )),
        SizedBox(
          width: constants.width / 40,
        ),
        Text(
          "Amazing Developer",
          style:
              TextStyle(color: Colors.white, fontSize: 32, letterSpacing: 1.5),
        ),
        SizedBox(
          width: constants.width / 40,
        ),
        MouseRegion(
            cursor: SystemMouseCursors.click,
            child: InkWell(
              onTap: () {
                launchUrl(Uri.parse(Constants.githubLink),
                    webOnlyWindowName: "_blank");
              },
              onHover: (value) {
                ishoveringgit.value = !ishoveringgit.value;
              },
              child: ValueListenableBuilder(
                valueListenable: ishoveringgit,
                builder: (context, value, child) {
                  return ishoveringgit.value == false
                      ? FaIcon(
                          FontAwesomeIcons.github,
                          color: Colors.white,
                          size: 32,
                        )
                      : AnimatedContainer(
                          duration: Duration(seconds: 2),
                          child: Transform.scale(
                            scale: 1.4,
                            child: Image.asset(
                              'assets/images/githubIcon.png',
                              height: 32,
                              width: 32,
                            ),
                          ));
                },
              ),
            ))
      ],
    ),
  );
}

Widget buildCarouselCard(Constants constants, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 10),
    child: Container(
      height: constants.height / 2.2,
      width: constants.width / 1,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25)),
      child: Stack(children: [
        Positioned(
          top: 0,
          left: 20,
          child: Container(
            width: constants.width / 9.7,
            decoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(25)),
            padding: EdgeInsets.only(left: 8),
            child: Text(
              "Language",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 1.2),
            ),
          ),
        ),
        Positioned(
          height: constants.height / 2.6,
          width: constants.width / 1,
          top: 40,
          left: 10,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.trackpad
            }),
            child: ListView.builder(
              itemCount: 40,
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(left: 5, right: 5),
                  child: Container(
                    width: constants.width / 5,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.all(8),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(25)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Container(
                              height: constants.height / 6,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
                                    fit: BoxFit.cover),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 4, 5, 0),
                            child: Text(
                              "Title",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 4, 5, 0),
                            child: Text(
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                              style: TextStyle(fontSize: 12, letterSpacing: 0),
                              maxLines: 3,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.teal.shade800,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: TextButton(
                                    onPressed: () {},
                                    onHover: (hover) {},
                                    child: Text(
                                      "Learn More",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.teal.shade800,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: TextButton(
                                    onPressed: () {},
                                    onHover: (hover) {},
                                    child: Text(
                                      "Visit",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
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
            ),
          ),
        ),
      ]),
    ),
  );
}
