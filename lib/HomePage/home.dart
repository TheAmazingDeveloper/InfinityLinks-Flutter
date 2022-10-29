import 'package:flutter/material.dart';
import 'package:infinitylinks/HomePage/Responsive/home_desktop.dart';
import 'package:infinitylinks/HomePage/Responsive/home_mobile.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (BuildContext context) => const HomeMobile(),
      desktop: (BuildContext context) => const HomeDesktop(),
      tablet: (BuildContext context) =>
          const HomeDesktop(), //TODO: Implement different widgets for different screentypes.
    );
  }
}
