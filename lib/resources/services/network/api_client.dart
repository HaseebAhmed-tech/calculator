import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'api_response_models.dart';

class ApiClient1 {
  static ApiClient1? _instance;

  String mBaseUrl;
  String mSiteCode;
  String? mAuthToken;
  String? symptomID;
  String? symptomKey;
  static String? userAgent = 'Dart/2.16 (dart:io)';

  Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'User-Agent': userAgent!.toLowerCase(),
  };

  ApiClient1(this.mSiteCode, this.mBaseUrl);

  static ApiClient1 get instance => _instance!;
  static BaseOptions? options;
  static Dio? _dio;
  static CancelToken cancelToken = CancelToken();

  static ApiClient1 create(siteCode, bool isCancled) {
    String baseUrl = 'https://$siteCode.cognitivehealthintl.com';
    options = BaseOptions(baseUrl: baseUrl);
    _dio = Dio(options);
    _dio!.interceptors
        .add(LogInterceptor(responseBody: true, requestBody: true));
    _instance = ApiClient1(siteCode, baseUrl);
    if (isCancled) {
      cancelToken = CancelToken();
    }

    return _instance!;
  }

  static void setAuthToken(authToken) {
    _instance?.mAuthToken = authToken;
  }

  static String? getAuthToken() {
    return _instance?.mAuthToken;
  }

  static String? getBaseUrl() {
    return _instance?.mBaseUrl;
  }

  Future<ApiSingleResponse<T>> callObjectApi<T>({
    required String endPoint,
    ApiPayload? req,
    required ModelFromJson fromJson,
  }) async {
    if (mAuthToken != null) {
      headers['Authorization'] = mAuthToken!;
    }

    String url = '$mBaseUrl/$endPoint';
    String payload = req == null ? '{}' : jsonEncode(req);
    // var formData = req == null ? {} : FormData.fromMap(req);
    var formData = req ?? {};

    debugPrint('Request: URL --> $url ----- Payload --> $payload');
    debugPrint('Request: URL --> $url ----- FormData --> $formData');

    final Response response;

    try {
      response = await _dio!.post(
        endPoint,
        options: Options(headers: headers),
        data: formData,
        cancelToken: cancelToken,
      );
      //   Uri.parse(url),
      //   headers: headers,
      //   body: payload,
      // ).timeout(Duration(seconds: 15));
    } on TimeoutException catch (_) {
      return ApiSingleResponse(null, <String, dynamic>{
        'Status': 'Error',
        'ErrorMessage': 'API Request timed out',
        'ErrorCode': -1,
      });
    } on SocketException catch (e) {
      return ApiSingleResponse(null, <String, dynamic>{
        'Status': 'Error',
        'ErrorMessage': e.message,
        'ErrorCode': -1,
      });
    } on DioError catch (e) {
      if (CancelToken.isCancel(e)) {
        debugPrint('Request canceled! ${e.message}');
        return ApiSingleResponse(null, <String, dynamic>{
          'Status': 'Error',
          'ErrorMessage': e.message,
          'ErrorCode': -1,
        });
      } else {
        return ApiSingleResponse(null, <String, dynamic>{
          'Status': 'Error',
          'ErrorMessage': e.response!.statusMessage,
          'ErrorCode': e.response!.statusCode,
        });
      }
    } catch (e) {
      return ApiSingleResponse(null, <String, dynamic>{
        'Status': 'Error',
        'ErrorMessage': e,
        'ErrorCode': -1,
      });
    }

    debugPrint('Resposne: URL --> $url ----- ${response.data.toString()}');

    // Map<String, dynamic> parsed =
    //     jsonDecode(response.data)?.cast<String, dynamic>();
    Map<String, dynamic> parsed = response.data!;

    return compute(parseObjectResponse, {
      'response': jsonEncode(parsed),
      'code': response.statusCode,
      'fromJson': fromJson,
    });
  }

  Future<ApiListResponse<T>> callListApi<T>({
    required String endPoint,
    ApiPayload? req,
    required ModelFromJson fromJson,
  }) async {
    if (mAuthToken != null) {
      headers['Authorization'] = mAuthToken!;
    }

    String url = '$mBaseUrl/$endPoint';
    String payload = req == null ? '{}' : jsonEncode(req);

    // var formData = req == null ? {} : FormData.fromMap(req);
    var formData = req ?? {};
    debugPrint('Request: URL --> $url ----- $payload');
    debugPrint('Request: URL --> $url ----- $formData');

    final Response response;

    try {
      response = await _dio!.post(endPoint,
          options: Options(headers: headers),
          data: formData,
          cancelToken: cancelToken);
      //   Uri.parse(url),
      //   headers: headers,
      //   body: payload,
      // ).timeout(Duration(seconds: 15));
    } on TimeoutException catch (_) {
      return ApiListResponse(null, <String, dynamic>{
        'Status': 'Error',
        'ErrorMessage': 'API Request timed out',
        'ErrorCode': -1,
      });
    } on SocketException catch (e) {
      return ApiListResponse(null, <String, dynamic>{
        'Status': 'Error',
        'ErrorMessage': e.message,
        'ErrorCode': -1,
      });
    } on DioError catch (e) {
      // The request was made and the server responded with a status code
      // that falls out of the range of 2xx and is also not 304.
      return ApiListResponse(null, <String, dynamic>{
        'Status': 'Error',
        'ErrorMessage': e.message,
        'ErrorCode': -1,
      });
    } catch (e) {
      return ApiListResponse(null, <String, dynamic>{
        'Status': 'Error',
        'ErrorMessage': e,
        'ErrorCode': -1,
      });
    }

    debugPrint('List Body: ${response.data}');

    Map<String, dynamic> parsed = response.data!;

    return compute(parseListResponse, {
      'response': jsonEncode(parsed),
      'code': response.statusCode,
      'fromJson': fromJson,
    });
  }
}

ApiListResponse<T> parseListResponse<T>(Map<String, dynamic> parameters) {
  final body = parameters['response'];
  final statusCode = parameters['code'];
  final fromJson = parameters['fromJson'];

  final Map<String, dynamic> parsed;

  try {
    parsed = jsonDecode(body)?.cast<String, dynamic>();
  } on FormatException {
    return ApiListResponse(null, <String, dynamic>{
      'Status': 'Error',
      'ErrorMessage': body,
      'ErrorCode': statusCode,
    });
  }

  if (statusCode != 200) {
    return ApiListResponse(null, parsed);
  }

  return ApiListResponse<T>.fromMap(parsed, fromJson);
}

ApiSingleResponse<T> parseObjectResponse<T>(Map<String, dynamic> parameters) {
  final body = parameters['response'];
  final statusCode = parameters['code'];
  final fromJson = parameters['fromJson'];

  final Map<String, dynamic> parsed;
  try {
    debugPrint('BODY: $body');
    parsed = jsonDecode(body)?.cast<String, dynamic>();
  } on FormatException {
    return ApiSingleResponse(null, <String, dynamic>{
      'Status': 'Error',
      'ErrorMessage': body,
      'ErrorCode': statusCode,
    });
  }

  if (statusCode != 200) {
    return ApiSingleResponse(null, parsed);
  }

  return ApiSingleResponse<T>.fromMap(parsed, fromJson);
}
