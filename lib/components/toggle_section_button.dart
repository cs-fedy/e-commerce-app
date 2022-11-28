import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';

class ToggleSectionButton extends StatelessWidget {
  final bool isSelected;
  final String content;
  final Function() clickHandler;
  const ToggleSectionButton({
    required this.content,
    required this.clickHandler,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        onPressed: clickHandler,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                width: 4,
                color: isSelected ? primaryColor : const Color(0xFFD9D9D9),
              ),
            ),
          ),
          child: Text(
            content,
            style: Theme.of(context)
                .textTheme
                .m16
                .copyWith(color: isSelected ? primaryColor : textColor),
          ),
        ),
      ),
    );
  }
}
