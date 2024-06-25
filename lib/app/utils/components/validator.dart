class Validators {
  static String? notEmpty(String? value, {required String? text}) {
    if (value == null || value.isEmpty || value == "null") {
      return "$text tidak boleh kosong";
    }
    return null;
  }
}
