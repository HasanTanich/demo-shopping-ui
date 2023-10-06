import 'package:flutter/material.dart';
import 'package:shopping_app_ui/widgets/navigation_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Profile Page"),
      ),
      body: const Center(
        child: Text("I'm profile page"),
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
