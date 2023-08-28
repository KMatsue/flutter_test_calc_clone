import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

class Logic {
  String _text = '0';

  get text => _text;

  // 表示する値
  double _displayValue = 0;

  // 最大桁数
  static const MAX_DIGIT = 9;

  //　現在の値
  double _currentValue = 0;

  // 現在の値(読込専用)
  get currentValue => _currentValue;

  // 足す、引く用の値
  double _memorialValue = 0;

  // 足す、引く用の値(読込専用)
  get memorialValue => _memorialValue;

  // 掛ける、割る用の値
  double _previousValue = 0;

  // 掛ける、割る用の値(読込専用)
  get previousValue => _previousValue;

  // かけ算か割り算を記録しておく
  String _previousOperation = '';

  // かけ算か割り算を記録しておく(読込専用)
  get previousOperation => _previousOperation;

  // たし算かひき算を記録しておく
  String _memorialOperation = '';

  // たし算かひき算を記録しておく(読込専用)
  get memorialOperation => _memorialOperation;

  // 小数点以下の桁数
  int _numAfterPoint = 0;
  bool _hasPoint = false;

  NumberFormat formatter = NumberFormat('#,###.########', 'en_US');

  void input(String text) {
    if (text == 'C') {
      _hasPoint = false;
      _numAfterPoint = 0;
      _text = currentValueReset();
      return;
    }

    if (text == '.') {
      _hasPoint = true;
    } else if (text == '=') {
      if (_previousOperation == 'x') {
        _displayValue = _previousValue * _currentValue;
      } else if (_previousOperation == '/') {
        _displayValue = _previousValue / _currentValue;
      } else if (_memorialOperation == '+') {
        _displayValue = _memorialValue + _currentValue;
      }
      resetValue();
    } else if (text == 'x') {
      if (_previousOperation == '') {
        _previousValue = _currentValue;
      } else {
        _previousValue = _previousValue * _currentValue;
      }
      _displayValue = _previousValue;
      _currentValue = 0;
      _previousOperation = text;
    } else if (text == '/') {
      if (_previousOperation == '') {
        _previousValue = _currentValue;
      } else {
        _previousValue = _previousValue / _currentValue;
      }
      _displayValue = _previousValue;
      _currentValue = 0;
      _previousOperation = text;
    } else if (text == '+') {
      if (_memorialOperation == '') {
        _memorialValue = _currentValue;
      } else {
        _memorialValue = _memorialValue + _currentValue;
      }
      _displayValue = _memorialValue;
      _currentValue = 0;
      _memorialOperation = text;
    } else {
      //　数値が入力された場合
      int digit = getNumberOfDigits(_currentValue);
      if (digit + _numAfterPoint == MAX_DIGIT) {
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
      _displayValue = _currentValue;
    }
    if (_hasPoint) {
      _text = getDisplayText(_displayValue, numAfterPoint: _numAfterPoint);
    } else {
      _text = getDisplayText(_displayValue);
    }
    if (kDebugMode) {
      print('input:$text | numAfterPoint:$_numAfterPoint | outputText:$_text');
    }
  }

  String getDisplayText(double value, {int numAfterPoint = -1}) {
    if (numAfterPoint != -1) {
      //整数入力時
      int intPart = value.toInt();
      if (numAfterPoint == 0) {
        // .を入力した時
        return '${formatter.format(value)}.';
      } else if (intPart == value) {
        // .を入力後数値を入力した時
        return formatter.format(intPart) +
            (value - intPart).toStringAsFixed(numAfterPoint).substring(1);
      }
      int digit = getNumberOfDigits(value);

      int decimalPart = MAX_DIGIT - digit;
      double roundedValue = round(value, decimalPart);
      return formatter.format(roundedValue);
    }
    return formatter.format(value);
  }

  /// 各種値をリセット
  void resetValue() {
    _currentValue = 0;
    _previousValue = 0;
    _memorialValue = 0;
    _previousOperation = '';
    _memorialOperation = '';
  }

  String currentValueReset() {
    _currentValue = 0;
    _displayValue = 0;
    _previousValue = 0;
    _memorialValue = 0;
    _previousOperation = '';
    _memorialOperation = '';
    return _displayValue.toStringAsFixed(0);
  }

  /// 整数の桁数を取得
  int getNumberOfDigits(double value) {
    int i = 0;
    for (; 10 <= value; i++) {
      value = value / 10;
      // print(value);
      // print(i);
    }
    return i + 1;
  }

  /// 四捨五入
  double round(double value, int numberOfDigits) {
    int key = math.pow(10, numberOfDigits).toInt();
    return (value * key).roundToDouble() / key;
  }
}
