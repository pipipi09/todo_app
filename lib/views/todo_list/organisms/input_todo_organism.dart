import 'package:flutter/material.dart';

class InputTodoOrganism extends StatelessWidget {
  const InputTodoOrganism({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 64),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          const TextField(
            decoration: InputDecoration(labelText: 'Todo'),
          ),
          Row(
            children: [
              const Text('2022/07/22'),
              IconButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2020),
                    lastDate: DateTime(2100),
                  );
                },
                icon: const Icon(
                  Icons.calendar_month_rounded,
                ),
              )
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Save'),
          )
        ],
      ),
    );
  }
}