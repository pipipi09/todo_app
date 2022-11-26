import 'package:flutter/material.dart';

class TextFieldAtom extends StatelessWidget {
  const TextFieldAtom({
    super.key,
    this.label = '',
    this.controller,
  });

  final String label;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      controller: controller,
    );
  }
}
