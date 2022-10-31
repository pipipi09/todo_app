import 'package:flutter/material.dart';

class TextFieldAtom extends StatelessWidget {
  const TextFieldAtom({
    super.key,
    this.label = '',
    required this.onChanged,
  });

  final String label;

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      onChanged: onChanged,
    );
  }
}
