import 'package:blog_app/core/models/blog.dart';
import 'package:blog_app/core/services/blog_service.dart';
import 'package:blog_app/core/view_models/base_model.dart';
import 'package:flutter/material.dart';

class BlogEntryViewModel extends BaseModel {
  BlogEntryViewModel({
    @required BlogService blogService,
  }) : _blogService = blogService;

  final BlogService _blogService;

  Future<Blog> fetch(id) async => _blogService.fetchOne(id);
}
