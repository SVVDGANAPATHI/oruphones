import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'http://40.90.224.241:5000/';

  Future<dynamic> get({required String endpoint}) async {
    final uri = Uri.parse('$baseUrl$endpoint');
    try {
      final response = await http.get(uri).timeout(const Duration(seconds: 60));
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
    required String body,
    required String endpoint,
  }) async {
    final url = Uri.parse('$baseUrl$endpoint'); 
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: body,
    );

    if (response.statusCode >= 200) {
      return jsonDecode(response.body); // Parse the JSON response
    } else {
      throw Exception('Failed to load data: ${response.statusCode}');
    }
  }


}
