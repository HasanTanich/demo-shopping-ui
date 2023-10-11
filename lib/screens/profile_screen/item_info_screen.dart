import 'package:flutter/material.dart';

class ProfileInfoScreen extends StatelessWidget {
  final int itemIndex;
  const ProfileInfoScreen({super.key, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Info page'),
      ),
      body: Center(
          child: Text(
        "I'm info screen $itemIndex",
      )),
    );
  }
}
