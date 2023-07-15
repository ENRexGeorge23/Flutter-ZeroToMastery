import 'package:flutter/material.dart';

class JordanPetersonPic extends StatelessWidget {
  const JordanPetersonPic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 100,
      width: 100,
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          'https://yt3.googleusercontent.com/Ko0UXEQL6PLt4CE_nQkI8aL6llY_GtWu-rQoZ3tgh1Gsmy7qKOrvazU4nBQOZ3kl0TZ3bivz4wM=s900-c-k-c0x00ffffff-no-rj',
        ),
      ),
    );
  }
}
