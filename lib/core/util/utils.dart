

// String? validateEmail(String? string) {
//   const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
//       r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
//       r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
//       r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
//       r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
//       r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
//       r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
//   final regex = RegExp(pattern);
//
//   return value!.isNotEmpty && !regex.hasMatch(value)
//       ? 'error'
//       : null;
// }

bool validateEmail(String string) {
  return RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(string);
}


bool validatePhone(String value) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  if (value.isEmpty) {
    return false;
  }
  else if (!regExp.hasMatch(value)) {
    return false;
  }
  return true;
}

int getTotalMoney(String fromDay, String toDay, int pricePerDay) {
  return
      (DateTime.parse(toDay)
      .difference(
        DateTime.parse(fromDay)).inDays + 1
      ) * pricePerDay;
}

String getFormattedRange(String fromDay, String toDay) {
  final fromDateTime = DateTime.parse(fromDay);
  final toDateTime = DateTime.parse(toDay);

  String format(int value) => (value < 10) ? "0$value" : "$value";

  return "${format(fromDateTime.day)}.${format(fromDateTime.month)}.${fromDateTime.year} - "
      "${format(toDateTime.day)}.${format(toDateTime.month)}.${toDateTime.year}";
}
