import 'package:flutter/cupertino.dart';

import 'my_colors.dart';

class MyDecorations {
  MyDecorations._();
  static BoxDecoration mainDecoration = BoxDecoration(
    borderRadius: BorderRadius.circular(30),
    gradient: const LinearGradient(colors: FromGradiant.bottomNav),
  );
}
