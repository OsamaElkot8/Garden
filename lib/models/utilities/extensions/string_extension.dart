import 'package:garden/ui/ui_constants.dart';

extension StringExtension on String {
  String shorts() {
    String _result = UiConstants.stringEmpty;
    final String _value = trim();

    if (_value.isNotEmpty) {
      final String _firstLetter = _value[0];
      _result = _firstLetter;

      if (_value.length > 1) {
        final int _lastLetterIndex = _value.length - 1;
        final String _lastLetter = _value[_lastLetterIndex];
        _result += _lastLetter;
      }
    }

    return _result;
  }
}
