import 'dart:convert';
import 'package:bettyesses123/app/common/widgets/show_snacbar.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:logger/logger.dart';

import '../shared_prefs_helper/shared_prefs_helper.dart';

class NetworkResponse {
  final int statusCode;
  final Map<String, dynamic>? responseData;
  final bool isSuccess;
  final String errorMessage;

  NetworkResponse({
    required this.statusCode,
    required this.isSuccess,
    this.responseData,
    this.errorMessage = 'something went wrong',
  });
}

class NetworkCaller {
  final Logger _logger = Logger();

  /// 🔐 Common Header Builder
  Future<Map<String, String>> _authHeaders({bool isJson = true}) async {
    final token = await SharedPreferencesHelper.getAccessToken() ?? '';
    return {
      if (isJson) 'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }

  Future<NetworkResponse> getRequest({required String url}) async {
    try {
      Uri uri = Uri.parse(url);
      final headers = await _authHeaders(isJson: false);

      _logRequest(url, headers);
      Response response = await get(uri, headers: headers);
      _logResponse(url, response);

      final decodeResponse = jsonDecode(response.body);

      if (response.statusCode == 200) {
        return NetworkResponse(
          statusCode: 200,
          isSuccess: true,
          responseData: decodeResponse,
        );
      } else {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: decodeResponse['message'],
        );
      }
    } catch (e) {
      return NetworkResponse(statusCode: -1, isSuccess: false);
    }
  }

  Future<NetworkResponse> postRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      if (kDebugMode) {
        debugPrint(
          'TOKEN => ${await SharedPreferencesHelper.getAccessToken()}',
        );
        debugPrint('BODY => $body');
      }

      Uri uri = Uri.parse(url);
      final headers = await _authHeaders();

      _logRequest(url, headers, requestBody: body);
      Response response = await post(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      _logResponse(url, response);
      final decodeData = jsonDecode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: true,
          responseData: decodeData,
        );
      } else {
        showSnackBar(false, decodeData['message']);
        return NetworkResponse(
          statusCode: response.statusCode,
          isSuccess: false,
          errorMessage: decodeData['message'],
        );
      }
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> putRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      final headers = await _authHeaders();

      _logRequest(url, headers);
      Response response = await put(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      _logResponse(url, response);
      final decodeData = jsonDecode(response.body);

      return NetworkResponse(
        statusCode: response.statusCode,
        isSuccess: response.statusCode == 200,
        responseData: decodeData,
      );
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> patchRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      final headers = await _authHeaders();

      _logRequest(url, headers);
      Response response = await patch(
        uri,
        headers: headers,
        body: jsonEncode(body),
      );

      _logResponse(url, response);
      final decodeData = jsonDecode(response.body);

      return NetworkResponse(
        statusCode: response.statusCode,
        isSuccess: response.statusCode == 200,
        responseData: decodeData,
      );
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  Future<NetworkResponse> deleteRequest({
    required String url,
    Map<String, dynamic>? body,
  }) async {
    try {
      Uri uri = Uri.parse(url);
      final headers = await _authHeaders();

      _logRequest(url, headers, requestBody: body);
      Response response = await delete(
        uri,
        headers: headers,
        body: body != null ? jsonEncode(body) : null,
      );

      _logResponse(url, response);
      final decodeData = jsonDecode(response.body);

      return NetworkResponse(
        statusCode: response.statusCode,
        isSuccess: response.statusCode == 200,
        responseData: decodeData,
        errorMessage: decodeData['message'] ?? '',
      );
    } catch (e) {
      return NetworkResponse(
        statusCode: -1,
        isSuccess: false,
        errorMessage: e.toString(),
      );
    }
  }

  void _logRequest(
    String url,
    Map<String, dynamic> headers, {
    Map<String, dynamic>? requestBody,
  }) {
    _logger.i('URL => $url\nHeaders => $headers\nRequest Body => $requestBody');
  }

  void _logResponse(String url, Response response) {
    _logger.i(
      'URL => $url\nStatus => ${response.statusCode}\nBody => ${response.body}',
    );
  }
}
