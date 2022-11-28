import 'package:e_commerce/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GoogleButton extends StatelessWidget {
  final String content;
  final Function() clickHandler;
  const GoogleButton({
    required this.content,
    required this.clickHandler,
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
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 27,
              height: 22,
              child: SvgPicture.asset("assets/svg/google.svg"),
            ),
            const SizedBox(width: 10),
            Text(
              content,
              style:
                  Theme.of(context).textTheme.r14.copyWith(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}
