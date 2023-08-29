import 'package:calc_clone/constant.dart';
import 'package:calc_clone/pages/button_part.dart';
import 'package:flutter/material.dart';

class KeyPadPart extends StatelessWidget {
  final ValueChanged onTap;

  const KeyPadPart({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button(
              "C",
              AppTheme.colorFunc,
              AppTheme.colorMain,
              onTap: (text) => onTap(text),
            ),
            Button(
              "+/-",
              AppTheme.colorFunc,
              AppTheme.colorMain,
              onTap: (text) => onTap(text),
            ),
            Button(
              "%",
              AppTheme.colorFunc,
              AppTheme.colorMain,
              onTap: (text) => onTap(text),
            ),
            Button(
              "/",
              AppTheme.colorCalc,
              AppTheme.colorText,
              onTap: (text) => onTap(text),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button(
              "7",
              AppTheme.colorNum,
              AppTheme.colorText,
              onTap: (text) => onTap(text),
            ),
            Button(
              "8",
              AppTheme.colorNum,
              AppTheme.colorText,
              onTap: (text) => onTap(text),
            ),
            Button(
              "9",
              AppTheme.colorNum,
              AppTheme.colorText,
              onTap: (text) => onTap(text),
            ),
            Button(
              "x",
              AppTheme.colorCalc,
              AppTheme.colorText,
              onTap: (text) => onTap(text),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button(
              "4",
              AppTheme.colorNum,
              AppTheme.colorText,
              onTap: (text) => onTap(text),
            ),
            Button(
              "5",
              AppTheme.colorNum,
              AppTheme.colorText,
              onTap: (text) => onTap(text),
            ),
            Button(
              "6",
              AppTheme.colorNum,
              AppTheme.colorText,
              onTap: (text) => onTap(text),
            ),
            Button(
              "-",
              AppTheme.colorCalc,
              AppTheme.colorText,
              onTap: (text) => onTap(text),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button(
              "1",
              AppTheme.colorNum,
              AppTheme.colorText,
              onTap: (text) => onTap(text),
            ),
            Button(
              "2",
              AppTheme.colorNum,
              AppTheme.colorText,
              onTap: (text) => onTap(text),
            ),
            Button(
              "3",
              AppTheme.colorNum,
              AppTheme.colorText,
              onTap: (text) => onTap(text),
            ),
            Button(
              "+",
              AppTheme.colorCalc,
              AppTheme.colorText,
              onTap: (text) => onTap(text),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Button(
              "0",
              AppTheme.colorNum,
              AppTheme.colorText,
              onTap: (text) => onTap(text),
            ),
            Button(
              ".",
              AppTheme.colorNum,
              AppTheme.colorText,
              onTap: (text) => onTap(text),
            ),
            Button(
              "=",
              AppTheme.colorCalc,
              AppTheme.colorText,
              onTap: (text) => onTap(text),
            ),
          ],
        ),
      ],
    );
  }
}
