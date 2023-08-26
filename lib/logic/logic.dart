class Logic {
  String _text = '0';

  get text => _text;

  double _currentValue = 0;

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
    _text = _currentValue.toStringAsFixed(0);
    print(_text);
  }

  void currentValueReset() {
    _currentValue = 0;
    _text = _currentValue.toStringAsFixed(0);
  }
}
