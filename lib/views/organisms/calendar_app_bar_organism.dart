import 'package:flutter/material.dart';

class CalendarAppBarOrganism extends StatelessWidget
    implements PreferredSizeWidget {
  const CalendarAppBarOrganism({super.key, this.onPressed});

  final VoidCallback? onPressed;

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar();
  }
}
