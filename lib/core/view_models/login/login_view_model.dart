import 'package:blog_app/core/constants/routes.dart';
import 'package:blog_app/core/services/authentication_service.dart';
import 'package:blog_app/core/services/navigation_service.dart';
import 'package:blog_app/core/view_models/base_model.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends BaseModel {
  LoginViewModel({
    @required AuthenticationService authenticationService,
    @required NavigationService navigationService,
  })  : _navigationService = navigationService,
        _authenticationService = authenticationService;

  AuthenticationService _authenticationService;
  NavigationService _navigationService;

  Future<void> submit({String email, String password}) async {
    await _authenticationService.signIn(email: email, password: password);

    _navigationService.pushNamed(Routes.BlogList);
  }
}
