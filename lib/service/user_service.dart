import 'dart:convert';

import 'package:app_paradisias/constant.dart';
import 'package:app_paradisias/model/api_response.dart';
import 'package:app_paradisias/model/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<ApiResponse> loginUser(String username, String password) async {
  SharedPreferences pref = await SharedPreferences.getInstance();
  ApiResponse apiResponse = ApiResponse();
  try {
    final response = await http.post(Uri.parse(baseUrl + auth + 'login/'),
        headers: {"accept": "application/json"},
        body: {"username": username, "password": password});
    if (response.statusCode == 200) {
      final data = User.fromJson(json.decode(response.body)['user']);

      apiResponse.data = data;
      print("StatuCode");
      final dat = data.toMap();
      final user = json.encode(dat);
      pref.setString("user", user);
    } else {
      apiResponse.error = json.decode(response.body)['non_field_errors'][0];
      print('${apiResponse.error}');
    }
  } catch (e) {
    print(e);
    apiResponse.error = 'Erreur : $e';
  }
  return apiResponse;
}
