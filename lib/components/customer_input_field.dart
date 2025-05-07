import 'package:flutter/material.dart';

class CustomInputField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final IconData? prefixIcon;
  final TextInputType keyboardType;
  final String? hintLabel;

  const CustomInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.hintLabel,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      cursorColor: const Color.fromARGB(255, 4, 15, 24),
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
        labelText: hintLabel,
        labelStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20,),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[400]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide:
          const BorderSide(color: Color.fromARGB(255, 4, 15, 24), width: 2.0),
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        prefixIconColor: MaterialStateColor.resolveWith((states) {
          return states.contains(MaterialState.focused)
              ? const Color.fromARGB(255, 4, 15, 24)
              : Colors.grey;
        }),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
