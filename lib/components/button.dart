import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String content;
  final Function() clickHandler;
  final bool isPrimary;
  const Button({
    required this.content,
    required this.clickHandler,
    required this.isPrimary,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: clickHandler,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 14,
        ),
        constraints: const BoxConstraints(
          minWidth: double.infinity,
        ),
        decoration: BoxDecoration(
          color: isPrimary ? primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          content,
          style: Theme.of(context)
              .textTheme
              .b14
              .copyWith(color: isPrimary ? Colors.white : primaryColor),
        ),
      ),
    );
  }
}
