import 'package:dio/dio.dart';
import 'package:my_store/core/network/network_constantes.dart';

class DioClient {
  final Dio dio;
  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: NetworkConstants.baseUrl,
          connectTimeout: const Duration(seconds: 10),
          receiveTimeout: const Duration(seconds: 10),
          // flutter run --dart-define=key=your_key_here
          // headers: {'key': String.fromEnvironment('key')},
        ),
      );
}
