

  String zeroLeadValue({required String value}) {
  if (value.startsWith('0') && value.length > 1) {
    return value.replaceAll(RegExp(r'^0+(?=.)'), '');
  } else {
    return value;
  }
}