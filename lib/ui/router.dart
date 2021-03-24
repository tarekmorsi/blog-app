import 'package:blog_app/core/constants/routes.dart';
import 'package:blog_app/ui/views/blog/blog_entry_view.dart';
import 'package:blog_app/ui/views/blog/blog_list_view.dart';
import 'package:blog_app/ui/views/login/login_view.dart';
import 'package:blog_app/ui/views/splash/splash_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Router {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.Splash:
        return MaterialPageRoute(
          builder: (context) => SplashView(),
        );
      case Routes.BlogList:
        return MaterialPageRoute(
          builder: (context) => BlogListView(),
        );
      case Routes.BlogEntry:
        final String id = settings.arguments;
        return MaterialPageRoute(
          builder: (context) => BlogEntryView(id),
        );
      case Routes.Login:
        return MaterialPageRoute(
          builder: (context) => LoginView(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            body: Center(
              child: Text('404 Not found'),
            ),
          ),
        );
    }
  }
}
