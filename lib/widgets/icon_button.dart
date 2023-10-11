import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;
  final bool isActive;

  const MyIconButton(
      {required this.icon,
      required this.onTap,
      required this.isActive,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.topLeft,
        child: Container(
          padding: const EdgeInsets.all(8),
          height: 50,
          width: 80,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.blue[200]!),
              borderRadius: BorderRadius.circular(8),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 5),
                  spreadRadius: 0,
                  blurRadius: 5,
                  color: Color.fromRGBO(82, 82, 91, 0.2),
                )
              ],
              color: isActive ? Colors.blue.shade200 : Colors.white),
          child: SvgPicture.asset(icon),
        ),
      ),
    );
  }
}
