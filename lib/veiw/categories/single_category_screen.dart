import 'package:flutter/material.dart';
import 'package:x2/models/post.dart';
import 'package:x2/veiw/screen_widgets/simple_card_news.dart';
import 'package:x2/veiw/screen_widgets/xapppar.dart';
import 'package:x2/models/category.dart';

import 'package:x2/api/getData.dart';

import 'package:x2/api/api_constans.dart';

import '../screens/single_news_screen.dart';




class SingleCategoryScreen extends StatefulWidget {
  Categories category ;

    SingleCategoryScreen({super.key, required this.category});




  @override
  State<SingleCategoryScreen> createState() => _SingleCategoryScreenState();
}

class _SingleCategoryScreenState extends State<SingleCategoryScreen> {




  @override


  Future<void> fetchCatPosts() async {

    String categoryId = widget.category.id.toString();
    List? items = await getData(baseUrlEmbedded, 'posts?categories=$categoryId&_embed',
            (json) => Post.fromJson(json));
    if(mounted){ setState(() {
      categoryPosts = List.from(items);
    });}

  }

  @override
  void initState() {
    super.initState();

    fetchCatPosts();
  }


  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: XAppar(title: widget.category.name,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.sizeOf(context).width,
              child: ListView.builder(
                itemCount: categoryPosts.length,
                itemBuilder: (context,index){
                  return  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleNewsScreen( post:categoryPosts[index],)));

                    },
                    child:SimpleCardNews(post: categoryPosts[index] ,postLoading: false,),
                  );

              },

              ),
            ),
          ],
        ),
      ),
    );
  }
}



