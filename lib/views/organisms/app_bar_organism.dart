import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppBarOrganism extends StatelessWidget implements PreferredSizeWidget {
  const AppBarOrganism({
    super.key,
    this.onPressed,
    required this.date,
  });

  final VoidCallback? onPressed;

  final DateTime date;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        DateFormat('yyyy/MM/dd').format(date),
        style: const TextStyle(
          color: Colors.white,
        ),
      ),
      actions: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(
            Icons.calendar_month_rounded,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
