class AppVectors {
  AppVectors._();
  static const String _basePath = 'assets/vectors/';
  static const String _format = '.svg';

  static const String appleIcon = '${_basePath}apple$_format';
  static const String googleIcon = '${_basePath}google$_format';
  static const String facebookIcon = '${_basePath}facebook$_format';
  static const String resetVector = '${_basePath}reset$_format';
  static const String bagVector = '${_basePath}bag$_format';
  static const String arrowDown = '${_basePath}arrow_down$_format';
  static const String arrowDownBlack = '${_basePath}arrow_down_black$_format';
  static const String arrowBack = '${_basePath}arrow_back$_format';
  static const String search = '${_basePath}search$_format';
  static const String orderVector = '${_basePath}order$_format';

  static generateActVector(String vectore) {
    return _basePath + vectore + _format;
  }

  static generateInActVector(String vectore) {
    return _basePath + vectore + _format;
  }
}
