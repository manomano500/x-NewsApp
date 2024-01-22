import 'package:flutter/material.dart';

import '../../api/removeAllHtmlTags.dart';
import '../../models/post.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';


class NewsHeadline extends StatelessWidget {
  const NewsHeadline({
    Key? key,
    required this.post,
  }) : super(key: key);

  final Post post;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
          ),
          Text(
            removeAllHtmlTags(post.title.toString()) ?? 'Title',
            style:const TextStyle(
              fontWeight: FontWeight.bold,

              height: 1.25,
            ),
          ),
           const SizedBox(height: 10),
          HtmlWidget(post.content!)  ,

        ],
      ),
    );
  }
}
