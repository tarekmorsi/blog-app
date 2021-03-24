import 'package:blog_app/core/constants/routes.dart';
import 'package:blog_app/core/services/authentication_service.dart';
import 'package:blog_app/core/services/navigation_service.dart';
import 'package:blog_app/core/view_models/base_model.dart';
import 'package:flutter/material.dart';

class SplashViewModel extends BaseModel {
  SplashViewModel({
    @required AuthenticationService authenticationService,
    @required NavigationService navigationService,
  })  : _navigationService = navigationService,
        _authenticationService = authenticationService;

  AuthenticationService _authenticationService;
  NavigationService _navigationService;

  init() {
    new Future.delayed(const Duration(seconds: 2), () {
      bool loggedIn = _authenticationService.isLoggedIn();
      if (loggedIn) {
        _navigationService.pushReplacementNamed(Routes.BlogList);
      } else {
        _navigationService.pushReplacementNamed(Routes.Login);
      }
    });
  }
}
