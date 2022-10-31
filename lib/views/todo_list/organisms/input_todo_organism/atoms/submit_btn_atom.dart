import 'package:flutter/material.dart';

class SubmitBtnAtom extends StatelessWidget {
  const SubmitBtnAtom({
    super.key,
    this.label = '',
    required this.onPressed,
  });
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        minimumSize: const Size(double.infinity, 40),
      ),
      onPressed: onPressed,
      child: Text(label),
    );
  }
}
