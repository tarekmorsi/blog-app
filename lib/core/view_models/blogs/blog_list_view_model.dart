import 'package:blog_app/core/constants/routes.dart';
import 'package:blog_app/core/models/blog.dart';
import 'package:blog_app/core/services/blog_service.dart';
import 'package:blog_app/core/services/navigation_service.dart';
import 'package:blog_app/core/view_models/base_model.dart';
import 'package:flutter/material.dart';

class BlogListViewModel extends BaseModel {
  BlogListViewModel({
    @required BlogService blogService,
    @required NavigationService navigationService,
  })  : _navigationService = navigationService,
        _blogService = blogService;

  final NavigationService _navigationService;
  final BlogService _blogService;

  Future<List<Blog>> fetch() async => _blogService.fetch();

  void navigate(String id) =>
      _navigationService.pushNamed(Routes.BlogEntry, arguments: id);
}
