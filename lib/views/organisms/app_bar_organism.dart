import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppBarOrganism extends StatelessWidget implements PreferredSizeWidget {
  const AppBarOrganism({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return AppBar(
      title: Text(
        DateFormat('yyyy/MM/dd').format(now),
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
