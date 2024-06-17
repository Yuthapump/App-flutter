import 'package:flutter/material.dart';

class MyInput extends StatefulWidget {
  final String label;
  final Icon? icon;
  final Color? iconColor;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final String? hintText;

  const MyInput({
    super.key,
    required this.label,
    this.icon,
    this.iconColor,
    this.validator,
    this.controller,
    this.obscureText = false,
    this.hintText,
  });

  @override
  State<MyInput> createState() => _MyInputState();
}

class _MyInputState extends State<MyInput> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: widget.obscureText,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.label,
        border: const OutlineInputBorder(),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        prefixIcon: widget.icon,
        prefixIconColor: widget.iconColor,
        hintText: widget.hintText,
      ),
      validator: widget.validator,
    );
  }
}
