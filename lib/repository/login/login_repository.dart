import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:open_jodel_flutter/model/login/login_request_model.dart';
import 'package:open_jodel_flutter/model/login/login_response_model.dart';


Future<LoginResponseModel> login(LoginRequestModel loginRequestModel) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final apiUrl = prefs.getString("APIURL") ?? "/localhost:5000";
  final response = await http.post(
    Uri.http(apiUrl, 'auth/login'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(loginRequestModel),
  );
  return LoginResponseModel.fromJson(jsonDecode(response.body));
}
