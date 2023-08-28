import 'package:intl/intl.dart';
import 'dart:math' as math;

class Logic {
  String _text = '0';

  get text => _text;

  /// 最大桁数
  static const MAX_DIGIT = 9;

  //　現在の値
  double _currentValue = 0;
  int _numAfterPoint = 0;
  bool _hasPoint = false;

  NumberFormat formatter = NumberFormat('#,###.#########', 'en_US');

  void input(String text) {
    print('input:$text');
    if (text == 'C') {
      _hasPoint = false;
      _numAfterPoint = 0;
      _text = currentValueReset();
      return;
    }

    if (text == '.') {
      _hasPoint = true;
    } else {
      //　数値が入力された場合
      int digit = getNumberOfDigits(_currentValue);
      if (digit+ _numAfterPoint == MAX_DIGIT ) {
        // return;
      } else if (_hasPoint) {
        _numAfterPoint++;
        _currentValue =
            _currentValue + int.parse(text) * math.pow(0.1, _numAfterPoint);
      } else if (_currentValue == 0) {
        _currentValue = double.parse(text);
      } else {
        _currentValue = _currentValue * 10 + double.parse(text);
      }
    }
    if (_hasPoint) {
      _text = getDisplayText(_currentValue, numAfterPoint: _numAfterPoint);
    } else {
      _text = getDisplayText(_currentValue);
    }

    print('numAfterPoint:$_numAfterPoint');

    print('outputText:$_text');
  }

  String getDisplayText(double value, {int numAfterPoint = -1}) {
    if (numAfterPoint != -1) {
      int intPart = value.toInt();
      if (numAfterPoint == 0) {
        return '${formatter.format(value)}.';
      } else if (intPart == value) {
        return formatter.format(intPart) +
            (value - intPart).toStringAsFixed(numAfterPoint).substring(1);
      }
    }
    return formatter.format(value);
  }

  String currentValueReset() {
    _currentValue = 0;
    return _currentValue.toStringAsFixed(0);
  }

  int getNumberOfDigits(double value) {
    int i = 0;
    for (; 10 <= value; i++) {
      value = value / 10;
      // print(value);
      // print(i);
    }
    return i + 1;
  }
}
