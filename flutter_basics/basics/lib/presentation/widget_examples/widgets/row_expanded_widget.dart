import 'package:flutter/material.dart';

class RowExpandedWidget extends StatelessWidget {
  const RowExpandedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Expanded(
          child: Text(
            "Here Goes Another Start for this journey to Flutter and Dart",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Container(
          height: 20,
          width: 20,
          color: Colors.yellow,
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          height: 20,
          width: 20,
          color: Colors.black,
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }
}
