import 'package:flutter_test/flutter_test.dart';
import 'package:intl/intl.dart';

main() {
  test('3桁区切りのテスト', () {
    NumberFormat formatter = NumberFormat('#,###', 'en_US');
    expect(formatter.format(1234), '1,234');
    expect(formatter.format(12345), '12,345');
    expect(formatter.format(12345678), '12,345,678');
  });

  test('小数点', () {
    NumberFormat formatter = NumberFormat('#,###.########', 'en_US');
    expect(formatter.format(123), '123');
    expect(formatter.format(1234), '1,234');
    expect(formatter.format(1234567), '1,234,567');
    expect(formatter.format(123456789), '123,456,789');

    expect(formatter.format(1.23), '1.23');
    expect(formatter.format(12.34), '12.34');
    expect(formatter.format(1234.567), '1,234.567');
    expect(formatter.format(1.23456789), '1.23456789');

    expect(formatter.format(0.00000001), '0.00000001');

    expect(formatter.format(1230.01), '1,230.01');
  });
}
