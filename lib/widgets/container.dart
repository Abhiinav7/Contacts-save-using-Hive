import 'package:flutter/material.dart';
class MyContainer extends StatelessWidget {
  Widget? child;
   MyContainer({super.key,required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      height: 58,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.deepPurple, width: 2)),

    );
  }
}
