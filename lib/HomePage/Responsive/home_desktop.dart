// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  @override
  Widget build(BuildContext context) {
    constants = Constants(context);
    return Scaffold(
      body: Container(
        height: constants.height,
        width: constants.width,
        decoration: BoxDecoration(
            //image: DecorationImage(
            //    image: AssetImage('assets/images/background.webp'),
            //    fit: BoxFit.fill),
            ),
        child: Column(
          children: [
            displayPic(constants),
            SizedBox(
              height: constants.height / 35,
            ),
            displayName(constants)
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
    height: constants.height / 14,
    width: constants.width / 3,
    padding: EdgeInsets.only(bottom: 3),
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
                          size: 36,
                        )
                      : AnimatedContainer(
                          duration: Duration(seconds: 2),
                          child: Image.asset(
                            'assets/images/instaIcon.png',
                            height: 36,
                            width: 36,
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
              TextStyle(color: Colors.white, fontSize: 36, letterSpacing: 1.5),
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
                          size: 36,
                        )
                      : AnimatedContainer(
                          duration: Duration(seconds: 2),
                          child: Transform.scale(
                            scale: 1.6,
                            child: Image.asset(
                              'assets/images/githubIcon.png',
                              height: 36,
                              width: 36,
                            ),
                          ));
                },
              ),
            ))
      ],
    ),
  );
}
