import 'package:flutter/cupertino.dart';

class Constants {
  BuildContext context;
  Constants(this.context);

  double get height => MediaQuery.of(context).size.height;
  double get width => MediaQuery.of(context).size.width;
}
