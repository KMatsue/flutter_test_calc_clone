import 'package:calc_clone/constant.dart';
import 'package:calc_clone/pages/button_part.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('テキスト', () {
    testWidgets('Button', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Button(
            '0',
            AppTheme.colorNum,
            AppTheme.colorText,
            onTap: null,
          ),
        ),
      );
      await tester.pump();
      expect(find.text('0'), findsOneWidget);
      expect(find.text('1'), findsNothing);
    });
    testWidgets('Button', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Button(
            '1',
            AppTheme.colorNum,
            AppTheme.colorText,
            onTap: null,
          ),
        ),
      );
      await tester.pump();
      expect(find.text('1'), findsOneWidget);
      expect(find.text('0'), findsNothing);
    });
  });

  group('押された時の処理', () {
    testWidgets('1', (WidgetTester tester) async {
      String result = '';

      onTap(String text) {
        result = text;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: Button(
            '1',
            Colors.black,
            Colors.white,
            onTap: (text) => onTap(text),
          ),
        ),
      );

      await tester.pump();

      expect(result, '');
      Finder finder = find.text('1');
      await tester.tap(finder);
      expect(result, '1');
    });

    testWidgets('2', (WidgetTester tester) async {
      String result = '';

      onTap(String text) {
        result = text;
      }

      await tester.pumpWidget(
        MaterialApp(
          home: Button(
            '2',
            Colors.black,
            Colors.white,
            onTap: (text) => onTap(text),
          ),
        ),
      );

      await tester.pump();

      expect(result, '');
      await tester.tap(find.text('2'));
      expect(result, '2');
    });
  });
  group('色', () {
    testWidgets('1', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Button(
            '1',
            Colors.black,
            Colors.white,
            onTap: null,
          ),
        ),
      );

      await tester.pump();

      Finder finder = find.byType(Material);
      Material material = tester.widget(finder);
      expect(material.color, Colors.black);
      expect(material.textStyle?.color, Colors.white);
    });

    testWidgets('2', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Button(
            '2',
            Colors.white,
            Colors.black,
            onTap: null,
          ),
        ),
      );

      await tester.pump();

      Finder finder = find.byType(Material);
      Material material = tester.widget(finder);
      expect(material.color, Colors.white);
      expect(material.textStyle?.color, Colors.black);
    });
  });
}
