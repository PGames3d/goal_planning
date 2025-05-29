import 'package:flutter/services.dart';

import 'common_utils.dart';

class PhoneNumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    return newValue.copyWith(
        text: CommonUtils.internationalPhoneFormat(text),
        selection: TextSelection.collapsed(
            offset: CommonUtils.internationalPhoneFormat(text).length));
  }
}
