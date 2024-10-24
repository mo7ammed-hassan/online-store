class AppImages {
  AppImages._();
  static const String baseUrl = 'assets/images/';
  static const String format = '.png';
  static const String appLogo = '${baseUrl}logo$format';
  static const String resetLogo = '${baseUrl}reset$format';
  static const String userVector = '${baseUrl}user_vector.jpg';

  static String getImagePath(String imageName) {
    return '$baseUrl$imageName$format';
  }
}
