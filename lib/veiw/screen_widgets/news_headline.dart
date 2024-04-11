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


           // const SizedBox(height: 10),

          Container(
            margin: EdgeInsets.only(top: 10,bottom: 15),
            
            child: Image.network(post.sourceImage!, ),
          ),
          Text(
            removeAllHtmlTags(post.title.toString()) ?? 'Title',
            style:const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20


            ),
          ),

          HtmlWidget(post.content!)  ,

        ],
      ),
    );
  }
}
