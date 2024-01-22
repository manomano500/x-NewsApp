import 'package:flutter/material.dart';
import 'package:x2/models/post.dart';
import 'package:x2/veiw/screen_widgets/news_headline.dart';

import 'package:x2/veiw/screen_widgets/xapppar.dart';

import '../../api/removeAllHtmlTags.dart';



class SingleNewsScreen extends StatelessWidget {
  final Post post ;
  const SingleNewsScreen({super.key, required this.post});


  @override
  Widget build(BuildContext context) {


    return   Scaffold(

      appBar: XAppar(title: removeAllHtmlTags(post.title!),),

        body: ListView(
          children: [
            NewsHeadline(post: post),
            //NewsBody(article: article),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Navigator.push(context,MaterialPageRoute(builder: (context)=>ArticleTileSmall(post: post, loading: false,)));

          },
          child: const Icon(Icons.save_alt),
        ),

    );
  }
}



