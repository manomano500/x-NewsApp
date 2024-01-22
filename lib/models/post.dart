

import 'dart:ui';

import 'package:x2/models/category.dart';

class Post{

   int? id;
   String? title;
   String? guid;
   String? content;
   String? post_author;
   String? sourceImage;
   String? category_name;
   Categories? categories;

   String? post_date;



   Post({this.id, this.title, this.content,this.post_author ,this.guid,required this.sourceImage,this.category_name ,this.post_date, required this.categories});
   factory Post.fromJson(Map<String, dynamic> json) {
     // var catId  =json
     // var guid;
     // var post_mime_type =json['post_mime_type'];
     //

      return Post(
       id: json['id']?? 0,
        title: json['title']['rendered']?? '',
        post_date: json['date']?? 0,
       content: json['content']['rendered']??'',
       post_author: json['_embedded']['author'][0]['name'] ??'',
          category_name: json['_embedded']['wp:term'][0][0]['name'] ??'',

        sourceImage: json['_embedded']['wp:featuredmedia'] != null &&
            json['_embedded']['wp:featuredmedia'].isNotEmpty &&
            json['_embedded']['wp:featuredmedia'][0]['source_url'] != null
            ? json['_embedded']['wp:featuredmedia'][0]['source_url']
            : '',
        categories: Categories.fromJson(json['_embedded']['wp:term'][0][0]),
       //




     );
     // post.category =Category(id: post.categoryId);






   }



}