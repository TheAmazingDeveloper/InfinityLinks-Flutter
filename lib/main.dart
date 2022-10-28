// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:infinitylinks/HomePage/home.dart';

void main() {
  runApp(const InfinityLinks());
}

class InfinityLinks extends StatelessWidget {
  const InfinityLinks({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InfinityLinks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: HomePage(),
    );
  }
}
