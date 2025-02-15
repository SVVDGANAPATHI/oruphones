import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:oruphones/config/api_service/authrepo/auth_repo.dart';

class ApiService {
  final String baseUrl = 'http://40.90.224.241:5000/';

  Future<dynamic> get({required String endpoint, Map<String, String>? headers}) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.get(uri, headers: headers ?? {'Content-Type': 'application/json'}).timeout(const Duration(seconds: 60));
      return json.decode(response.body);
    } on SocketException {
      throw Exception('No Internet connection. Please try again later.');
    } on TimeoutException {
      throw Exception('Connection timed out. Please try again later.');
    } on http.ClientException {
      throw Exception('Connection failed. Please check the server.');
    } catch (e) {
      throw Exception('Unexpected error: $e');
    }
  }

  Future<Map<String, dynamic>> post({
    Map<String, String>? headers,
    required String body,
    required String endpoint,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final response = await http.post(
      url,
      headers: headers ?? {'Content-Type': 'application/json'},
      body: body,
    );
    if (endpoint == 'login/otpValidate') {
      final cookie = response.headers['set-cookie'];
      await AuthRepo().storetoken(cookie: cookie);
    }
    if (response.statusCode >= 200) {
      return jsonDecode(response.body);
    } else if (response.statusCode == 401) {
      return jsonDecode(response.body);
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }
}
