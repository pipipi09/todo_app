import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../view_model/calendar_view_model.dart';
import '../../view_model/date_view_model.dart';
import '../../view_model/todo_view_model.dart';

class CalendarOrganism extends HookConsumerWidget {
  const CalendarOrganism({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final date = ref.watch(dateViewModelProvider);
    final todosMap = ref.watch(dayTodoMapProvider);
    var focusedDay = useState<DateTime>(date);
    var selectedDay = useState<DateTime>(date);
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
        if (!isSameDay(selectedDay.value, selected)) {
          selectedDay.value = selected;
          focusedDay.value = forcused;
          ref
              .read(dateViewModelProvider.notifier)
              .changeDate(selectedDay.value);
          ref
              .read(todoListViewModelProvider.notifier)
              .loadByDate(selectedDay.value);
        }
      },
      eventLoader: (day) {
        return todosMap[day] ?? [];
      },
    );
  }
}
