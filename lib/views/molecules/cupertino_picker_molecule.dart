import 'package:flutter/cupertino.dart';

import '../atoms/cupertino_picker_item_atom.dart';

class CupertinoPickerMolecule extends StatelessWidget {
  const CupertinoPickerMolecule({
    required this.items,
    required this.onSelectedItemChanged,
    super.key,
  });

  final List<String> items;

  final ValueChanged<int> onSelectedItemChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 3,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: CupertinoPicker(
          itemExtent: 40,
          onSelectedItemChanged: onSelectedItemChanged,
          children: items
              .map(
                (item) => CupertinoPickerItemAtom(text: item),
              )
              .toList(),
        ),
      ),
    );
  }
}
