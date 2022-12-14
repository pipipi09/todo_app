import 'package:flutter/material.dart';

class CupertinoPickerItemAtom extends StatelessWidget {
  const CupertinoPickerItemAtom({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
