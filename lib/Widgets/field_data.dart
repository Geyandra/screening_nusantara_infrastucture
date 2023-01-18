import 'package:flutter/material.dart';

class FieldData extends StatelessWidget {
  final String label;
  final String hintext;
  final int? maxlines;
  final IconData icon;
  final Widget? suffixicon;
  final TextEditingController? controller;
  final validator;
  final keyboardtype;
  const FieldData({
    required this.icon,
    required this.label,
    Key? key,
    this.controller,
    this.validator,
    this.keyboardtype,
    this.suffixicon,
    required this.hintext,
    this.maxlines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: TextFormField(
        maxLines: maxlines,
        validator: validator,
        controller: controller,
        keyboardType: keyboardtype,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: suffixicon,
            hintText: hintext,
            suffixIconColor: Colors.blue,
            filled: true,
            fillColor: Colors.grey.shade100,
            label: Text(label),
            labelStyle: TextStyle(color: Colors.blue.shade600),
            prefixIcon: Icon(
              icon,
              color: Colors.blue,
            ),
            border: OutlineInputBorder(),
            enabledBorder:
                OutlineInputBorder(borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }
}
