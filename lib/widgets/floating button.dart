import 'package:flutter/material.dart';
class MyFloating extends StatelessWidget {
  Icon icon;
  String tip;
  void Function()? onPressed;
   MyFloating({
     super.key,
     required this.icon,
     required this.tip,
     required this.onPressed

   });

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      onPressed: onPressed,
      tooltip: tip,
      shape: CircleBorder(),
      child: icon,



    );
  }
}
