class AppImage {
  static const String _basePath = 'assets/images';

  static String _imagePath(String fileName) => '$_basePath/$fileName';

  static final kImageLogoPNG = _imagePath('logo.png');
  static final kImageLogoGooglePNG = _imagePath('logo_google.png');
  static final kImageMosfeedTextPNG = _imagePath('mosfeed_text.png');
  static final kImageMosfeedTextBluePNG = _imagePath('mosfeed_text_blue.png');
  static final kImageBackgrountInfaqPNG = _imagePath('background-infaq.png');
}
