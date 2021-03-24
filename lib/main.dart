import 'package:blog_app/core/services/navigation_service.dart';
import 'package:blog_app/provider_setup.dart';
import 'package:blog_app/ui/router.dart';
import 'package:blog_app/ui/shared/theme.dart';
import 'package:flutter/material.dart' hide Router;
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        navigatorKey: NavigationService.navigatorKey,
        title: 'Blog App',
        theme: theme,
        onGenerateRoute: Router.onGenerateRoute,
      ),
    );
  }
}
