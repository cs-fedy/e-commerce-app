import 'package:flutter/material.dart';

class ConfigButton extends StatelessWidget {
  final String content;
  final Function() clickHandler;

  const ConfigButton({
    required this.content,
    required this.clickHandler,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: clickHandler,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 5.25,
          vertical: 9.63,
        ),
        decoration: BoxDecoration(
            border: Border.all(
              width: 0.8,
              color: const Color(0xFFD9D9D9),
            ),
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 3.5),
                blurRadius: 3.5,
                color: const Color(0xFFFBF9F9).withAlpha(20),
              ),
            ]),
        child: Text(
          content,
          style: const TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
