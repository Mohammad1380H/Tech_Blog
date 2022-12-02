import 'package:flutter/material.dart';
import 'package:tech_bloc/my_colors.dart';

// ignore: must_be_immutable
class TechDivider extends StatelessWidget {
   TechDivider({
    Key? key,
    required this.width,
  }) : super(key: key);

  double width ;

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: FromColors.dividerColor,
      indent:width,
      endIndent: width

    );
  }
}
