import 'package:flutter/material.dart';

import '../organisms/calendar_app_bar_organism.dart';
import '../templates/calendar_page/calendar_template.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CalendarAppBarOrganism(
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: const SafeArea(
        child: CalendarTemplate(),
      ),
    );
  }
}
