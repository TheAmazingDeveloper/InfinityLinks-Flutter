// ignore_for_file: prefer_const_constructors, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:infinitylinks/HomePage/home.dart';

void main() async {
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyB9ohweWVN6j5qGa95gVR6Ih_NTLNOjesI",
          authDomain: "infinity-links-932f1.firebaseapp.com",
          databaseURL:
              "https://infinity-links-932f1-default-rtdb.firebaseio.com",
          projectId: "infinity-links-932f1",
          storageBucket: "infinity-links-932f1.appspot.com",
          messagingSenderId: "968302165696",
          appId: "1:968302165696:web:7efb4e6d39c3ca2b99f725"));
  runApp(const InfinityLinks());
}

class InfinityLinks extends StatelessWidget {
  const InfinityLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazing Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: HomePage(),
    );
  }
}
