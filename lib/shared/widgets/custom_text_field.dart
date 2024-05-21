import 'package:flutter/cupertino.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String placeholder;

  const CustomTextField({
    Key? key,
    required this.controller,
    this.placeholder = '',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      controller: controller,
      placeholder: placeholder,
      placeholderStyle: const TextStyle(
        color: CupertinoColors.systemGrey,
      ),
      style: const TextStyle(
        color: CupertinoColors.black,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: CupertinoColors.black,
        ),
        borderRadius: BorderRadius.circular(7.0),
      ),
      padding: const EdgeInsets.symmetric(vertical: 19.0, horizontal: 15.0),
    );
  }
}
