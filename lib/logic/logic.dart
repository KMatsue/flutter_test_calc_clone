import 'package:intl/intl.dart';
import 'dart:math' as math;

class Logic {
  String _text = '0';

  get text => _text;

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
      if (_hasPoint) {
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
      if (numAfterPoint == 0) {
        return '${formatter.format(value)}.';
      } else if (value == 0) {
        return value.toStringAsFixed(numAfterPoint);
      } else {
        return formatter.format(value);
      }
    } else {
      return formatter.format(value);
    }
  }

  String currentValueReset() {
    _currentValue = 0;
    return _currentValue.toStringAsFixed(0);
  }
}
