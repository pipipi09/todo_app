import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSection({super.key});

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
          onPressed: () {},
          icon: const Icon(
            Icons.calendar_month_rounded,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
