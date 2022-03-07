class BaseUrlConstant {
  static BaseUrlConstant? _instace;
  static BaseUrlConstant get instance {
    _instace ??= BaseUrlConstant._init();
    return _instace!;
  }

  BaseUrlConstant._init();
  static const baseUrl = 'https://reqres.in/';
}
