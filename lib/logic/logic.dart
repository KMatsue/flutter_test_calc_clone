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
      currentValueReset();
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
      if (_numAfterPoint == 0) {
        _text = '${formatter.format(_currentValue)}.';
      } else if (_currentValue == 0) {
        _text = _currentValue.toStringAsFixed(_numAfterPoint);
      } else {
        _text = formatter.format(_currentValue);
      }
    } else {
      _text = formatter.format(_currentValue);
    }
    print('numAfterPoint:$_numAfterPoint');

    print('outputText:$_text');
  }

  getDisplayTExt(double value, {int numAfterPoint = -1}){

  }

  void currentValueReset() {
    _currentValue = 0;
    _text = _currentValue.toStringAsFixed(0);
  }
}
