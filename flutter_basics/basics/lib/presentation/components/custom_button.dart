import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Ink(
      width: 50,
      height: 50,
      color: Colors.blue,
      child: InkWell(
        onTap: () {},
        splashColor: Colors.red,
      ),
    ));
  }
}
