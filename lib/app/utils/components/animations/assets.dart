enum Animations {
  loading,
  empty;

  String get toLottieAnimation => "assets/images/animations/lot_$name.json";
}
