// ignore_for_file: prefer_const_constructors

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
            // image: DecorationImage(
            //     image: AssetImage('assets/images/background.webp'),
            //     fit: BoxFit.cover),
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
