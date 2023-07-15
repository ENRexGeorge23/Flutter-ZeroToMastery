import 'package:flutter/material.dart';

class ButtonExample extends StatelessWidget {
  const ButtonExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.red)),
          onPressed: () {},
          child: Container(
            width: 150,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Center(
                child: Text(
                  'Text Button',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.play_arrow),
        ),
        Switch(value: true, onChanged: (value) {})
      ],
    );
  }
}
