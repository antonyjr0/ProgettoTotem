import 'dart:convert';

import 'package:http/http.dart' as http;

const String baseUrl = "localhost:3150";

class Api {
  static fetch(String url,
      [Map<String, String>? headers, dynamic params]) async {
    //final finalUrl = Uri.https(baseUrl, 'api/v1/$url', params);
    final finalUrl =
        Uri.http(baseUrl, 'api/v1/$url', params); // usare http o https
    headers ??= {
      'Content-type': 'application/json',
      //'Authorization': 'Bearer $accessToken'
    };
    final response = await http.get(finalUrl, headers: headers);

    return response;
  }

  static post(String url, Object data,
      [Map<String, String>? headers, dynamic params]) async {
    final finalUrl = Uri.http(baseUrl, 'printer/$url', params);
    headers ??= {
      'Content-type': 'application/json',
      //'Authorization': 'Bearer $accessToken'
    };
    http.Response response;
    try {
      // json.encode richiama il metodo toJson definito nella classe
      response = await http.post(
        finalUrl,
        headers: headers,
        body: json.encode(data),
      );

      if (response.statusCode == 200) {
        return response.body;
      } else {
        var err = response.body.toString();
        return err == "" ? "error" : err;
      }
    } catch (e) {
      return e == "" ? "error" : e;
    }
  }
}
