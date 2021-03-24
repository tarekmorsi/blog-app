import 'package:blog_app/core/models/user.dart';
import 'package:blog_app/core/services/api.dart';
import 'package:blog_app/core/services/authentication_service.dart';
import 'package:blog_app/core/services/blog_service.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'core/services/navigation_service.dart';

List<SingleChildWidget> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<SingleChildWidget> independentServices = [
  ChangeNotifierProvider.value(value: User()),
  Provider.value(value: NavigationService()),
];

List<SingleChildWidget> dependentServices = [
  ProxyProvider<User, Api>(
    update: (context, user, api) => Api(token: user.token),
  ),
  ProxyProvider2<User, Api, AuthenticationService>(
    update: (context, user, api, authenticationService) =>
        AuthenticationService(user: user, api: api),
  ),
  ProxyProvider<Api, BlogService>(
    update: (context, api, blogService) => BlogService(api: api),
  ),
];

List<SingleChildWidget> uiConsumableProviders = [];
