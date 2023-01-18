import 'package:flutter/material.dart';

class Authfield extends StatelessWidget {
  final TextEditingController control;
  final String hintText;
  final IconData icon;
  const Authfield({
    Key? key,
    required this.control,
    required this.hintText,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        controller: control,
        decoration: InputDecoration(
            prefixIcon: Icon(icon),
            hintText: hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
