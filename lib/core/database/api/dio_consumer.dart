import 'package:dio/dio.dart';
import 'package:social_media_feed/core/network/error_message_model.dart';
import '../../error/exceptions.dart';
import 'api_consumer.dart';
import 'api_interceptors.dart';
import 'end_points.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer(this.dio) {
    dio.options.baseUrl = EndPoint.baseUrl;
    dio.interceptors.add(ApiInterceptors());
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));
  }
  @override
  Future delete(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var res = await dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var res = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future patch(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      var res = await dio.patch(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
        bool isFormData = false ,
  }) async {
    try {
      var res = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return res.data;
    } on DioException catch (e) {
      handleDioException(e);
    }
  }

  handleDioException(e) {
    switch (e.type) {
      case DioExceptionType.badCertificate:
        throw BadCertificateException(errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));
      case DioExceptionType.connectionTimeout:
        throw ConnectionTimeoutException(errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
      case DioExceptionType.sendTimeout:
        throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));

      case DioExceptionType.badResponse:
        switch (e.response?.statusCode) {
          case 400: //bad request
            throw BadRequestException(errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));

          case 401: //unauthorized
            throw UnauthorizedException(errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));

          case 403: //forbidden
            throw ForbiddenException(errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));

          case 404: //notFound
            throw NotFoundException(errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));

          case 409: //conflict
            throw ConflictException(errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));

          case 504: //conflict
            throw BadRequestException(errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));
          // print(e.response);
        }
      case DioExceptionType.cancel:
        throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));

      case DioExceptionType.unknown:
        throw ServerException(errorMessageModel: ErrorMessageModel.fromJson(e.response!.data));

      // throw ServerException('badResponse');
    }
  }
}
