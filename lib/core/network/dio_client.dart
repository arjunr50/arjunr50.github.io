import 'package:dio/dio.dart';
import 'package:portfolio/core/constants/constant.dart';
import 'package:portfolio/core/network/endpoints.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(){
    initialiseDio();
  }

  void initialiseDio() {
    _dio.options
      ..connectTimeout = const Duration(seconds: 10)
      ..receiveTimeout = const Duration(seconds: 15);

    _dio.interceptors.addAll([
      InterceptorsWrapper(
        onRequest: (options, handler) {
          options.headers['X-API-Key'] = appId;
          handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (error, handler) {
          handler.next(error);
        },
      ),
    ]);
  }

  Future<ResponseWrapper> request({
    required EndPoint endPoint,
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _sendRequest(
        type: endPoint.requestType,
        url: endPoint.url,
        data: data,
        queryParams: queryParams,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    } catch (e) {
      return ResponseWrapper(
        isSuccess: false,
        statusCode: 0,
        description: e.toString(),
      );
    }
  }

  Future<Response> _sendRequest({
    required RequestType type,
    required String url,
    dynamic data,
    Map<String, dynamic>? queryParams,
  }) {
    switch (type) {
      case RequestType.get:
        return _dio.get(url, queryParameters: queryParams);
      case RequestType.post:
        return _dio.post(url, data: data, queryParameters: queryParams);
      case RequestType.patch:
        return _dio.patch(url, data: data, queryParameters: queryParams);
      case RequestType.put:
        return _dio.put(url, data: data, queryParameters: queryParams);
      case RequestType.delete:
        return _dio.delete(url, data: data, queryParameters: queryParams);
    }
  }

  ResponseWrapper _handleResponse(Response response) {
    final httpStatusCode = response.statusCode ?? 0;
    final jsonBody = response.data as Map<String, dynamic>?;

    // Handle successful response (success: true)
    if (jsonBody?['success'] == true) {
      return ResponseWrapper(
        data: jsonBody?['data'],
        statusCode: httpStatusCode,
        isSuccess: true,
        description: jsonBody?['description']?.toString(), // Safely get description
      );
    }

    // Handle failed response (success: false)
    if (jsonBody?['success'] == false) {
      return ResponseWrapper(
        data: jsonBody,
        statusCode: httpStatusCode,
        isSuccess: false,
        description: jsonBody?['description']?.toString() ??
            'Request failed', // Use description or default
      );
    }

    // Handle HTTP error codes (400+)
    if (httpStatusCode >= 400) {
      return ResponseWrapper(
        data: jsonBody,
        statusCode: httpStatusCode,
        isSuccess: false,
        description: jsonBody?['description']?.toString() ??
            jsonBody?['error']?.toString() ??
            'Server error ($httpStatusCode)',
      );
    }

    // Handle other responses (200-399)
    return ResponseWrapper(
      data: jsonBody,
      statusCode: httpStatusCode,
      isSuccess: httpStatusCode >= 200 && httpStatusCode < 300,
      description: jsonBody?['description']?.toString(),
    );
  }

  ResponseWrapper _handleError(DioException e) {
    if (e.response != null) {
      final response = e.response!;
      final jsonBody = response.data as Map<String, dynamic>?;

      return ResponseWrapper(
        data: jsonBody,
        statusCode: response.statusCode ?? 0,
        isSuccess: false,
        description: jsonBody?['description']?.toString() ??
            jsonBody?['error']?.toString() ??
            response.statusMessage ??
            'Network error',
      );
    } else {
      return ResponseWrapper(
        data: null,
        statusCode: 0,
        isSuccess: false,
        description: e.message ?? 'Network connection failed',
      );
    }
  }
}

class ResponseWrapper<T> {
  final T? data;
  final int statusCode;
  final String? description;
  final bool isSuccess;

  ResponseWrapper({
    this.data,
    required this.statusCode,
    this.description,
    required this.isSuccess,
  });
}