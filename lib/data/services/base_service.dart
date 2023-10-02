import 'dart:convert';

import 'package:flutter_full_course/config/app_config.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart' as parser;

abstract class ServiceBase<T> {
  Future<T> call();

  Uri _getV1Url(String url) => Uri.parse('${AppConfig.baseUrl}/$url');

  Future<Map<String, dynamic>> get(String apiUrl, String? token) async {
    return _handleResponse(await MyRequest(token).get(_getV1Url(apiUrl)));
  }

  Future<Map<String, dynamic>> post(
    String apirUrl, {
    Map<String, dynamic>? body,
    String? token,
  }) async {
    try {
      final response =
          await MyRequest(token).post(_getV1Url(apirUrl), body: body);

      return _handleResponse(response);
    } catch (e) {
      throw Exception(e);
    }
  }

  Map<String, dynamic> _handleResponse(http.Response response) {
    return jsonDecode(response.body);
  }

  Future<Map<String, dynamic>> upload(
      String apiUrl, String fieldName, String path, String? token) async {
    try {
      final client = http.MultipartRequest('POST', _getV1Url(apiUrl));
      if (token != null) {
        client.headers.addAll({'Authorization': 'Bearer $token'});
      }
      client.files.add(await http.MultipartFile.fromPath(fieldName, path,
          contentType: parser.MediaType('image', 'jpeg')));

      return _handleResponse(
          await http.Response.fromStream(await client.send()));
    } catch (e) {
      throw Exception(e);
    }
  }
}

class MyRequest extends http.BaseClient {
  final String? token;

  MyRequest(this.token);
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) {
    if (token != null) {
      request.headers['Authorization'] = 'Bearer $token';
    }
    return request.send();
  }
}
