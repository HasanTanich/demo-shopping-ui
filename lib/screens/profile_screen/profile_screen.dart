import 'package:flutter/material.dart';
import 'package:shopping_app_ui/screens/profile_screen/item_info_screen.dart';
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
      body: Center(
        child: ListView(
          restorationId: 'list_demo_list_view',
          padding: const EdgeInsets.symmetric(vertical: 8),
          children: [
            for (int index = 1; index < 21; index++)
              ListTile(
                  leading: ExcludeSemantics(
                    child: CircleAvatar(child: Text('$index')),
                  ),
                  title: Center(child: Text('$index')),
                  trailing: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProfileInfoScreen(itemIndex: index),
                          ),
                        );
                      },
                      icon: const Icon(Icons.info_outline))),
          ],
        ),
      ),
      bottomNavigationBar: const MyNavigationBar(),
    );
  }
}
