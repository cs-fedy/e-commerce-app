import 'dart:convert';

import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getData(String url) async {
  final response = await http.get(Uri.parse(url));
  final decodedBytes = utf8.decode(response.bodyBytes);
  return jsonDecode(decodedBytes);
}
