import 'package:blog_app/core/models/blog.dart';
import 'package:blog_app/core/view_models/blogs/blog_entry_view_model.dart';
import 'package:blog_app/ui/shared/typography.dart';
import 'package:blog_app/ui/views/base_widget.dart';
import 'package:blog_app/ui/widgets/progress_indicator.dart';
import 'package:flutter/material.dart' hide ProgressIndicator;
import 'package:provider/provider.dart';

class BlogEntryView extends StatelessWidget {
  final String blogId;

  BlogEntryView(this.blogId);

  @override
  Widget build(BuildContext context) {
    return BaseWidget<BlogEntryViewModel>(
      model: BlogEntryViewModel(
        blogService: Provider.of(context),
      ),
      builder: (_, model, context) {
        return Scaffold(
          appBar: AppBar(),
          body: FutureBuilder(
            future: model.fetch(blogId),
            builder: (context, AsyncSnapshot<Blog> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CustomProgressIndicator();
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Failed to fetch blog $blogId 🙁',
                    style: body20,
                  ),
                );
              }

              if (snapshot.data == null) {
                return Center(
                  child: Text(
                    'Blog not found 🙁',
                    style: body20,
                  ),
                );
              }

              Blog blog = snapshot.data;

              return SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Blog #${blog?.id ?? 'N/A'}'),
                    Divider(),
                    Text('Created at: ${blog?.formattedDate ?? 'N/A'}'),
                    Text(blog?.title ?? 'Title not found', style: heading40),
                    Divider(),
                    Image.network(
                      blog?.imageUrl ?? '',
                      errorBuilder: (context, _, stack) => Container(
                        color: Colors.grey.shade300,
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.3,
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
