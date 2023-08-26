import 'package:calc_clone/logic/logic.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  late Logic logic;
  setUp(() {logic = Logic();});
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

  test('連続入力', (){
    expect(logic.text, '0');
    logic.input('1');
    expect(logic.text, '1');
    logic.input('2');
    expect(logic.text, '12');
  });
}
