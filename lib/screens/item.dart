import 'package:argon_flutter/models/books.dart';
import 'package:http/http.dart' as http;

var url = Uri.parse("https://restfull-tokobuku.herokuapp.com/API/");

class BookItem {
  geyBooks() async {
    var data = await http.get(url);
  }
}
