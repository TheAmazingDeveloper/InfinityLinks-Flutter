// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:infinitylinks/constants/constants.dart';

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
  ValueNotifier ishovering = ValueNotifier(false);
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
              onTap: () {},
              onHover: (value) {
                ishovering.value = !ishovering.value;
              },
              child: ValueListenableBuilder(
                valueListenable: ishovering,
                builder: (context, value, child) {
                  return ishovering.value == false
                      ? FaIcon(
                          FontAwesomeIcons.instagram,
                          color: Colors.white,
                          size: 36,
                        )
                      : AnimatedContainer(
                          duration: Duration(seconds: 2),
                          child: Image.asset('assets/images/instaIcon.png'));
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
          child: FaIcon(
            FontAwesomeIcons.github,
            color: Colors.white,
            size: 36,
          ),
        )
      ],
    ),
  );
}
