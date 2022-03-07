enum IUnknownServicePath { unknownPath }

extension IUnknownServicePathExtension on IUnknownServicePath {
  String get rawValue {
    switch (this) {
      case IUnknownServicePath.unknownPath:
        return '/api/unknown';
    }
  }
}
