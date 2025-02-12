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

}
