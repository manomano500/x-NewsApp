import 'package:flutter/material.dart';
import 'package:x2/models/post.dart';
import 'package:x2/veiw/screen_widgets/news_card.dart';

import 'package:x2/veiw/screen_widgets/xapppar.dart';

import 'package:x2/api/getData.dart';


import '../../api/api_constans.dart';

class SinglePostsScreen extends StatefulWidget {
  const SinglePostsScreen({
    super.key,
  });

  @override
  State<SinglePostsScreen> createState() => _SinglePostsScreenState();
}

class _SinglePostsScreenState extends State<SinglePostsScreen> {
  bool postLoading=true;


  @override
  Future<void> fetchPosts() async {
    setState(() {
      postLoading = true;

    });
    List? items = await getData(
        baseUrlEmbedded, postsEndPoint, (json) => Post.fromJson(json));
    if (mounted) {
      print('items: $items');
      setState(() {
        posts = List.from(items);
        print('posts: $posts');
        setState(() {
          postLoading = false;

        });
      });
    }
  }

  @override
  void initState() {
    super.initState();

    fetchPosts();
    print('singlepostsscreen');
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: ()async {
        fetchPosts();

      },
      child: Scaffold(
        appBar: const XAppar(title: 'Latest Posts'),
        body: SingleChildScrollView(
          child: SizedBox(

            height: 700,
            width: MediaQuery.sizeOf(context).width,
            child: ListView.builder(

              itemCount: posts.length,
              itemBuilder: (context, index) {
                return NewsCard(post: posts[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
