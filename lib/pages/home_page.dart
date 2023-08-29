import 'package:calc_clone/constant.dart';
import 'package:calc_clone/logic/logic.dart';
import 'package:calc_clone/pages/key_pad_part.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    key: const Key('txtResult'),
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
