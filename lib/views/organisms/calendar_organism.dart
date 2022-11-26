import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarOrganism extends HookWidget {
  const CalendarOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    var focusedDay = useState<DateTime>(DateTime.now());
    var selectedDay = useState<DateTime>(DateTime.now());
    return TableCalendar(
      firstDay: DateTime.utc(2020, 1, 1),
      lastDay: DateTime.utc(2030, 12, 31),
      focusedDay: focusedDay.value,
      headerStyle: const HeaderStyle(
        formatButtonVisible: false,
      ),
      calendarFormat: CalendarFormat.month,
      selectedDayPredicate: (day) => isSameDay(selectedDay.value, day),
      onDaySelected: (selected, forcused) {
        selectedDay.value = selected;
        focusedDay.value = forcused;
      },
    );
  }
}
