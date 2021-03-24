import 'package:blog_app/core/models/user.dart';
import 'package:blog_app/core/services/api.dart';

class AuthenticationService {
  final Api _api;
  final User _user;

  AuthenticationService({
    Api api,
    User user,
  })  : _api = api,
        _user = user;

  bool isLoggedIn() => _user.token != null;

  Future<void> signIn({String email, String password}) async {
    final String token = await _api.signIn(email: email, password: password);
    _user.token = token;
  }
}
