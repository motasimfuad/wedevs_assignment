import 'package:flutter/material.dart';

class OutlinedInputField extends StatelessWidget {
  const OutlinedInputField({
    super.key,
    required this.hintText,
    required this.controller,
    this.labelText,
  });
  final String hintText;
  final TextEditingController controller;
  final String? labelText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: const OutlineInputBorder(),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Required';
        }
        return null;
      },
    );
  }
}
