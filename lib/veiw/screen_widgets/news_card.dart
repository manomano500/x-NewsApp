import 'package:flutter/material.dart';
import 'package:x2/models/post.dart';

import '../../functions/removeAllHtmlTags.dart';
import '../single_news_screen.dart';

class NewsCard extends StatelessWidget {
  final Post post;

  const NewsCard({super.key, required this.post,});

  @override
  Widget build(BuildContext context) {
    return  Card(
      color: Theme.of(context).cardTheme.color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      child:SizedBox(
        width: 400,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset('assets/pls.png',
               ),
            ),
            ListTile(
              title: Text(
                removeAllHtmlTags(
                  post.title!.split(' ').take(12).join(' ').toString(),
                ),
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              trailing: Text(
                removeAllHtmlTags(post.category_name!.split('').take(12).join(' ').toString()),
                style: const TextStyle(fontSize: 13),
              ),
              subtitle: Text(
                removeAllHtmlTags(
                  post.content!.split(' ').take(12).join(' ').toString(),
                ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleNewsScreen( post:post,)));
              },
            ),
          ],
        ),
      ),



    );
  }
}
