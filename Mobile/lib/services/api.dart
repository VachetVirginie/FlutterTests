import 'dart:convert';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:ngtv_mobile/env.dart';
import 'package:ngtv_mobile/models/user.dart';

class Api {
  final String _urlLogin = 'http://$IP:8080/login_check';
  final String _urlPlayersMe = 'http://$IP:8080/players/me.json';

  Api();

  //
  // Send post request to /login_check
  // Return: String token
  //
  Future<String> postLoginCheck(
    String email,
    String password,
  ) async {
    final http.Response response = await http.post(_urlLogin,
        headers: {HttpHeaders.contentTypeHeader: "application/json"},
        body: json.encode({'email': email, 'password': password}));

    if (response.statusCode == 200) {
      final _jsonTokenResponse = json.decode(response.body);
      return _jsonTokenResponse['token'];
    }
    if (response.statusCode == 401) {
      throw UnauthorizedException;
    }
    throw NetworkException;
  }

  //
  // Send get request to /players/me.json
  // Return User
  //
  Future<User> getPlayerMe(String token) async {
    final http.Response response = await http.get(
      _urlPlayersMe,
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.authorizationHeader: "Bearer $token",
      },
    );

    if (response.statusCode == 200) {
      return User.fromJson(json.decode(response.body));
    }

    if (response.statusCode == 401) {
      throw UnauthorizedException;
    }
    throw NetworkException;
  }
}

class UnauthorizedException implements Exception {
  String errorMessage() {
    return 'Bad credentials.';
  }
}

class NetworkException implements Exception {
  String errorMessage() {
    return 'Failed to send http request';
  }
}
