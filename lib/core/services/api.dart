import 'dart:convert';

import 'package:blog_app/core/models/blog.dart';
import 'package:http/http.dart';

class Api {
  static String endpoint = '60585b2ec3f49200173adcec.mockapi.io';
  String get prefix => '/api/v1';
  String _token;

  Api({String token}) : _token = token;

  Map<String, String> get _headers => <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $_token'
      };

  Future<String> signIn({String email, String password}) async {
    final uri = Uri.https(endpoint, "$prefix/login", null);

    Response response = await post(uri);
    _handleResponse(response);

    Map<String, dynamic> json =
        _decodeResponse(response) as Map<String, dynamic>;

    String token = json['token'];

    return token;
  }

  Future<List<Blog>> getBlogs() async {
    List<Blog> blogs = List<Blog>();

    final uri = Uri.https(endpoint, "$prefix/blogs", null);

    Response response = await get(uri, headers: _headers);
    _handleResponse(response);

    List<dynamic> list = _decodeResponse(response) as List<dynamic>;

    blogs = list.map((e) => Blog.fromJson(e)).toList();

    return blogs;
  }

  Future<Blog> getBlog(String id) async {
    Blog blog;

    final uri = Uri.https(endpoint, "$prefix/blogs/$id", null);

    Response response = await get(uri, headers: _headers);
    _handleResponse(response);

    Map<String, dynamic> json =
        _decodeResponse(response) as Map<String, dynamic>;

    blog = Blog.fromJson(json);

    return blog;
  }

  dynamic _decodeResponse(Response response) =>
      (json.decode(utf8.decode(response.bodyBytes)));

  _handleResponse(Response response) {
    // print(response.request.url);
    // print(response.request.headers);
    // print(response.statusCode);
    // print(response.body);

    switch (response.statusCode) {
      case 200:
      case 201:
        return;
      case 400:
        throw _parseErrorMessage(response);
      case 500:
        throw 'Internal Server Error';
        break;
      default:
        throw 'Unknown Error';
    }
  }

  _parseErrorMessage(Response response) {
    return response.body;
  }
}
