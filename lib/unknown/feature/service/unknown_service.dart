import 'package:dio/dio.dart';

import '../../core/constant/extension/network_path.dart';
import '../model/unknown_model.dart';

abstract class IUnknownService {
  final Dio dio;
  IUnknownService(this.dio);

  final String unknownPath = IUnknownServicePath.unknownPath.rawValue;
  Future<UnknownModel?> fetchUnknown();
}

class UnknownService extends IUnknownService {
  UnknownService(Dio dio) : super(dio);

  Future<UnknownModel?> fetchUnknown() async {
    final response = await dio.get(unknownPath);

    if (response.statusCode == 200) {
      return UnknownModel.fromJson(response.data);
    } else {
      return null;
    }
  }
}
