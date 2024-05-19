import 'package:flutter/material.dart';

import 'package:wise_repeat/shared/bloc/exports.dart';

class ThemePicker extends StatelessWidget {
  const ThemePicker({
    super.key,
    required this.activeOption,
    required this.onChanged,
  });

  final ThemeOption activeOption;
  final ValueChanged<ThemeOption> onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ThemeOption.values.map((option) {
        return GestureDetector(
          onTap: () => onChanged(option),
          child: ListTile(
            title: Text(option.toReadableString()),
            leading: Radio<ThemeOption>(
              value: option,
              groupValue: activeOption,
              onChanged: (ThemeOption? value) => onChanged(option),
            ),
          ),
        );
      }).toList(),
    );
  }
}
