import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';
main(){
  test('3桁区切りのテスト',(){
    NumberFormat formatter = NumberFormat('#,###', 'en_US');
    expect(formatter.format(1234), '1,234');
    expect(formatter.format(12345), '12,345');
    expect(formatter.format(12345678), '12,345,678');
  });
}