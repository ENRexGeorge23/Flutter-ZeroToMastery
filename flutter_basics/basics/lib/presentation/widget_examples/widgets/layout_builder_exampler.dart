import 'package:flutter/material.dart';

class LayOutBuilderExampler extends StatelessWidget {
  const LayOutBuilderExampler({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: 300,
      color: Colors.orange,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Center(
            child: Container(
              color: Colors.purple,
              width: constraints.maxWidth / 2,
              height: constraints.maxHeight / 2,
              child: const Center(
                child: Text('Layout Builder'),
              ),
            ),
          );
        },
      ),
    );
  }
}
