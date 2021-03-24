import 'package:blog_app/core/models/blog.dart';
import 'package:blog_app/core/view_models/blogs/blog_list_view_model.dart';
import 'package:blog_app/ui/shared/typography.dart';
import 'package:blog_app/ui/views/base_widget.dart';
import 'package:blog_app/ui/widgets/progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BlogListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BaseWidget<BlogListViewModel>(
      model: BlogListViewModel(
        blogService: Provider.of(context),
        navigationService: Provider.of(context),
      ),
      builder: (_, model, context) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Blog List'),
          ),
          body: FutureBuilder<List<Blog>>(
            future: model.fetch(),
            builder: (context, AsyncSnapshot<List<Blog>> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CustomProgressIndicator();
              }

              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Failed to fetch blogs 🙁',
                    style: body20,
                  ),
                );
              }

              if (snapshot.data == null || snapshot.data.isEmpty) {
                return Center(
                  child: Text(
                    'No blogs found 🙁',
                    style: body20,
                  ),
                );
              }

              final List<Blog> blogs = snapshot.data;

              return ListView.builder(
                itemCount: blogs.length,
                itemBuilder: (context, index) {
                  Blog blog = blogs[index];

                  return Container(
                    margin: EdgeInsets.only(bottom: 10),
                    child: ListTile(
                      onTap: () => model.navigate(blog.id),
                      leading: Image.network(blog.imageUrl),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${blog.formattedDate}',
                            style: body12,
                          ),
                          Text('${blog.title}'),
                        ],
                      ),
                      trailing: Icon(
                        Icons.chevron_right_outlined,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}
