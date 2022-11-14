import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

abstract class ApiService {
  Future<Map<String, dynamic>> getData(
      String url, Map<String, dynamic> queryParams);
}

class ApiServiceImplementation implements ApiService {
  const ApiServiceImplementation();

  @override
  Future<Map<String, dynamic>> getData(
      String url, Map<String, dynamic> queryParams) async {
    // try {
    final http.Response response = await http.get(
      Uri.parse(url).replace(queryParameters: queryParams),
    );

    if (response.statusCode == 200) {
      return response.body.isNotEmpty
          ? json.decode(response.body) as Map<String, dynamic>
          : {};
    } else {
      log(response.statusCode.toString(), name: "Status Code");
      throw Exception("Status code: ${response.statusCode}");
    }
    // } catch (e) {
    //   throw Exception("Failed to fetch data");
    // }
  }
}
