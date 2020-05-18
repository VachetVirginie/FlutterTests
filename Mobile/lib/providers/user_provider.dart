import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:ngtv_mobile/service_container.dart';
import 'package:ngtv_mobile/services/api.dart';
import 'package:ngtv_mobile/models/user.dart';

enum Status { Authenticated, Authenticating, Unauthenticated }

// provider used at the main level
// use Provider.of<UserProvider>(context); to get access of it and if you want to rebuilt your
// widget when listener notify changes.
// use Provider.of<UserProvider>(context, listen: false) to have access to get without any rebuilt
class UserProvider extends ChangeNotifier {
  Api _api = serviceContainer<Api>();

  User _user;
  Status _status;
  String _token;
  String _error;

  // Constructor
  UserProvider.instance() {
    _user = null;
    _status = Status.Unauthenticated;
    _token = null;
    _error = null;
  }

  // Getters
  Status get status => _status;
  String get token => _token;
  User get user => _user;
  String get error => _error;
  String get name => _user.name;
  String get email => _user.email;

  // Send request to /login_check to get JWT Token
  // and then
  // Send request to /players/me to get user infos
  Future<bool> login(String email, String password) async {
    try {
      _status = Status.Authenticating;
      notifyListeners();

      final String tokenResponse = await _api.postLoginCheck(email, password);
      _token = tokenResponse;
      final User user = await _api.getPlayerMe(_token);
      _user = user;

      _status = Status.Authenticated;
      notifyListeners();

      return true;
    } catch (e) {
      if (e is UnauthorizedException) {
        _error = e.errorMessage();
      } else {
        _error = 'Failed to login';
      }

      _status = Status.Unauthenticated;
      notifyListeners();

      return false;
    }
  }

  void signOut() {
    _user = null;
    _token = null;
    _error = null;
    _status = Status.Unauthenticated;
    notifyListeners();
  }
}
