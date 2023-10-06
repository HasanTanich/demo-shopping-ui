import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class MyIconButton extends StatelessWidget {
  final String icon;
  final VoidCallback onTap;

  const MyIconButton({required this.icon, required this.onTap, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(8),
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Container(
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
              color: Colors.white),
          padding: const EdgeInsets.all(8),
          height: 60,
          width: 80,
          child: SvgPicture.asset(icon),
        ),
      ),
    );
  }
}
