import 'dart:convert';

import 'package:argon_flutter/models/books.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

var _baseApiUrl = Uri.parse('https://restfull-tokobuku.herokuapp.com/API/');
var header = {'authorization': 'naklupak123'};

List<Book> parseResults(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Book>((json) => Book.fromJson(json)).toList();
}

Future<List<Book>> fetchBooks(http.Client client) async {
  final response = await client.get(_baseApiUrl, headers: header);
  return compute(parseResults, response.body);
}
