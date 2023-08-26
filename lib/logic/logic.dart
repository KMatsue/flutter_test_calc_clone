import 'package:intl/intl.dart';
class Logic {
  String _text = '0';

  get text => _text;

  double _currentValue = 0;

  NumberFormat formatter = NumberFormat('#,###', 'en_US');

  void input(String text) {
    if (text == 'C') {
      currentValueReset();
      return;
    }
    if (_currentValue == 0) {
      _currentValue = double.parse(text);
    } else {
      _currentValue = _currentValue * 10 + double.parse(text);
    }
    _text = formatter.format(_currentValue);
    print(_text);
  }

  void currentValueReset() {
    _currentValue = 0;
    _text = _currentValue.toStringAsFixed(0);
  }
}
