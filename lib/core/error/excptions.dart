import 'package:my_store/core/network/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  const ServerException({required this.errorModel});
}

class LocalException implements Exception {
  final String message;

  const LocalException({required this.message});
}
