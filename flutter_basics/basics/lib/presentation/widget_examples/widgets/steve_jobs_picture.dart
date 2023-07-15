import 'package:flutter/material.dart';

class SteveJobsPicture extends StatelessWidget {
  const SteveJobsPicture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 100,
          width: 100,
          child: Image.asset(
            'assets/steve.jpg',
            fit: BoxFit.cover,
          ),
        ),
        const Positioned(
          top: 80,
          left: 20,
          child: Text(
            'Steve Jobs',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
