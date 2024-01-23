// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert'; //it converts different formats

class NetworkHelper {
  final String url;
  Map<String, String> headers = {};

  NetworkHelper({required this.url});

  Future getData() async {
    http.Response response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }

  Future postData(String postUrl, String phone, String pass) async {
    print(phone + pass);
    http.Response response = await http.post(Uri.parse(postUrl),
        headers: {"content-type": "application/json"},
        body: jsonEncode({'phone': phone, 'password': pass}));
    if (response.statusCode == 200) {
      String data = response.body;
      updateCookie(response);
      return jsonDecode(data);
    } else {
      return response.statusCode;
    }
  }

  void updateCookie(http.Response response) {
    String? rawCookie = response.headers['set-cookie'];
    if (rawCookie != null) {
      int index = rawCookie.indexOf(';');
      headers['cookie'] =
          (index == -1) ? rawCookie : rawCookie.substring(0, index);
    }
  }
}
