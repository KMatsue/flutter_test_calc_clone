import 'package:calc_clone/constant.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String text;

  final Color colorButton;

  final Color colorText;

  final ValueChanged<String> onTap;

  const Button(this.text, this.colorButton, this.colorText,
      {super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: ElevatedButton(
        onPressed: () => onTap(text),
        style: ElevatedButton.styleFrom(
          foregroundColor: colorText,
          backgroundColor: colorButton,
          minimumSize: Size.zero,
          padding: EdgeInsets.zero,
          shape: text == "0" ? const StadiumBorder() : const CircleBorder(),
        ),
        child: Padding(
          padding: text == "0"
              ? const EdgeInsets.only(left: 20, top: 20, right: 100, bottom: 20,)
              : text.length == 1
              ? const EdgeInsets.all(22)
              : const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: AppTheme.mapIcon.containsKey(text)
              ? Icon(
            AppTheme.mapIcon[text],
            size: 26,
          )
              : Text(
            text,
            style: const TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
