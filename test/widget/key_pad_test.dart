import 'package:calc_clone/pages/key_pad_part.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('テキスト', () {
    testWidgets('数字', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: KeyPadPart(onTap: (value) {}),
        ),
      );

      await tester.pump();
      for (int i = 0; i < 10; i++) {
        expect(find.text(i.toString()), findsOneWidget);
      }
    });
    testWidgets('文字', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: KeyPadPart(onTap: (value) {}),
        ),
      );

      await tester.pump();
      expect(find.text('C'), findsOneWidget);
      expect(find.text('.'), findsOneWidget);

      expect(find.text('+'), findsNothing);
      expect(find.text('='), findsNothing);
    });
    testWidgets('アイコン', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: KeyPadPart(onTap: (value) {}),
        ),
      );

      await tester.pump();
      expect(find.byIcon(CupertinoIcons.plus_slash_minus), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.percent), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.divide), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.multiply), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.minus), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.plus), findsOneWidget);
      expect(find.byIcon(CupertinoIcons.equal), findsOneWidget);
    });
  });

  group('キータップ', () {
    testWidgets('数字', (WidgetTester tester) async {
      String result = '';
      onTap(String text) {
        result += text;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: KeyPadPart(onTap: (text) => onTap(text)),
        ),
      );

      await tester.pump();
      await tester.tap(find.text('1'));
      await tester.tap(find.text('2'));
      await tester.tap(find.text('3'));
      await tester.tap(find.text('4'));
      await tester.tap(find.text('5'));
      await tester.tap(find.text('6'));
      await tester.tap(find.text('7'));
      await tester.tap(find.text('8'));
      await tester.tap(find.text('9'));
      await tester.tap(find.text('0'));

      expect(result, '1234567890');
    });

    testWidgets('文字', (WidgetTester tester) async {
      String result = '';
      onTap(String text) {
        result += text;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: KeyPadPart(onTap: (text) => onTap(text)),
        ),
      );
      await tester.pump();
      await tester.tap(find.text('C'));
      await tester.tap(find.text('.'));

      expect(result, 'C.');
    });

    testWidgets('アイコン', (WidgetTester tester) async {
      String result = '';

      onTap(String text) {
        result += text;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: KeyPadPart(onTap: (text) => onTap(text)),
        ),
      );

      await tester.pump();
      await tester.tap(find.byIcon(CupertinoIcons.plus_slash_minus));
      await tester.tap(find.byIcon(CupertinoIcons.percent));
      await tester.tap(find.byIcon(CupertinoIcons.divide));
      await tester.tap(find.byIcon(CupertinoIcons.multiply));
      await tester.tap(find.byIcon(CupertinoIcons.minus));
      await tester.tap(find.byIcon(CupertinoIcons.plus));
      await tester.tap(find.byIcon(CupertinoIcons.equal));

      expect(result, '+/-%/x-+=');
    });
  });
}
