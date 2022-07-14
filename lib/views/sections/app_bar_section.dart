import 'package:flutter/material.dart';

class AppBarSection extends StatelessWidget implements PreferredSizeWidget {
  const AppBarSection({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Todos and Habits',
        style: TextStyle(
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
