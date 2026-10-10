import 'package:equatable/equatable.dart';

class ErrorModel extends Equatable {
  final String message;
  final String error;
  final int statusCode;

  const ErrorModel({
    required this.message,
    required this.error,
    required this.statusCode,
  });

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      message: json['message'],
      error: json['error'],
      statusCode: json['statusCode'],
    );
  }

  @override
  List<Object?> get props => [message, error, statusCode];
}
