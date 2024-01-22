import 'package:flutter/material.dart';
import 'package:x2/models/post.dart';

import '../../api/removeAllHtmlTags.dart';
import '../../constants/size_constants.dart';
import '../categories/single_category_screen.dart';
import '../screens/single_news_screen.dart';

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
              child: Image.network(
                post.sourceImage ?? '',
                height: 200,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.fill,
                // if the image is null
                errorBuilder: (BuildContext context,
                    Object exception, StackTrace? stackTrace) {
                  return Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            Sizes.dimen_10)),
                    child: const SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: Icon(Icons.broken_image_outlined),
                    ),
                  );
                },
              )
                // ___________________
            ),
            ListTile(
              title: Text(
                removeAllHtmlTags(
                  post.title!.split(' ').take(12).join(' ').toString(),
                ),
                style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              trailing: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleCategoryScreen(category: post.categories! )));

                },
                child: Text(
                  removeAllHtmlTags(post.category_name!),
                  style: const TextStyle(fontSize: 13),
                ),
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
