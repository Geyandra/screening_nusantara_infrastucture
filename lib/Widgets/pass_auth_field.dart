import 'package:flutter/material.dart';

class PassAuthfield extends StatefulWidget {
  final TextEditingController control;
  final String hintText;
  final IconData icon;
  const PassAuthfield({
    Key? key,
    required this.control,
    required this.hintText,
    required this.icon,
  }) : super(key: key);

  @override
  State<PassAuthfield> createState() => _PassAuthfieldState();
}

class _PassAuthfieldState extends State<PassAuthfield> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        obscureText: obscureText,
        controller: widget.control,
        decoration: InputDecoration(
            prefixIcon: Icon(widget.icon),
            suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: obscureText
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off)),
            hintText: widget.hintText,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}