import 'package:calc_clone/constant.dart';
import 'package:calc_clone/logic/logic.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String txtResult = "0";

  final Logic _logic = Logic();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colorMain,
      body: Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    txtResult,
                    style: const TextStyle(
                      color: AppTheme.colorText,
                      fontSize: 60,
                    ),
                    textAlign: TextAlign.right,
                    maxLines: 1,
                  ),
                )
              ],
            ),
            KeyPadPart(
              onTap: (text) => tapButton(text),
            )
          ],
        ),
      ),
    );
  } // end of st

  void tapButton(String text) {
    _logic.input(text);
    setState(
      () => txtResult = _logic.text,
    );
  } // ate class
}

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
