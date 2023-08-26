import 'package:calc_clone/logic/logic.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late Logic logic;
  setUp(() {
    logic = Logic();
  });
  test('1をそのまま出力', () {
    logic.input('1');
    expect(logic.text, '1');
  });
  test('2をそのまま出力', () {
    logic.input('2');
    expect(logic.text, '2');
  });
  test('3をそのまま出力', () {
    logic.input('3');
    expect(logic.text, '3');
  });

  test('連続入力', () {
    expect(logic.text, '0');
    logic.input('1');
    expect(logic.text, '1');
    logic.input('2');
    expect(logic.text, '12');
    logic.input('3');
    expect(logic.text, '123');
    logic.input('4');
    expect(logic.text, '1,234');
    logic.input('5');
    expect(logic.text, '12,345');
    logic.input('6');
    expect(logic.text, '123,456');
    logic.input('7');
    expect(logic.text, '1,234,567');
    logic.input('8');
    expect(logic.text, '12,345,678');
    logic.input('9');
    expect(logic.text, '123,456,789');
  });

  test('0を出力', () {
    logic.currentValueReset();
    expect(logic.text, '0');
  });
}
