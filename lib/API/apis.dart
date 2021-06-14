import 'package:http/http.dart' as http;

var url = Uri.parse('https://restfull-tokobuku.herokuapp.com/API/');

var data = http.get(url);
