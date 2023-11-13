import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (_) => AlertDialog(
              content: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: const Image(
                  image: AssetImage('assets/images/bird.webp'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        child: SizedBox(
          height: 50,
          width: 50,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: const Image(
              image: AssetImage('assets/images/bird.webp'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
