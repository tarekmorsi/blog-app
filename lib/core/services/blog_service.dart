import 'package:blog_app/core/models/blog.dart';
import 'package:blog_app/core/services/api.dart';

class BlogService {
  final Api _api;

  BlogService({
    Api api,
  }) : _api = api;

  Future<List<Blog>> fetch() async {
    final List<Blog> blogs = await _api.getBlogs();
    return blogs;
  }

  Future<Blog> fetchOne(String id) async {
    final Blog blog = await _api.getBlog(id);
    return blog;
  }
}
