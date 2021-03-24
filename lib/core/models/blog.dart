import 'package:intl/intl.dart';

class Blog {
  String id;
  String createdAt;
  String title;
  String imageUrl;

  Blog({
    this.id,
    this.createdAt,
    this.title,
    this.imageUrl,
  });

  Blog.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    createdAt = json['createdAt'] as String;
    title = json['title'] as String;
    imageUrl = json['imageUrl'] as String;
  }

  String get formattedDate {
    var date = DateTime.parse(createdAt);
    var format = DateFormat.yMd();
    var dateString = format.format(date);

    return dateString;
  }
}
