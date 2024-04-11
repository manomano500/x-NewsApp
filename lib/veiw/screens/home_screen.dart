
import 'package:flutter/material.dart';

import 'package:x2/veiw/screen_widgets/simple_card_news.dart';

import '../../api/api_constans.dart';
import '../../models/post.dart';
import '../../api/getData.dart';
import '../screen_widgets/headerName.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool postLoading = true;


  @override
  void dispose() {
    // Cancel ongoing asynchronous operations when the widget is disposed.
    cancelToken.cancel("Widget disposed");
    super.dispose();
  }


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
    // TODO: implement initState

    fetchPosts();
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: RefreshIndicator (
          onRefresh: ()async {
            fetchPosts();

          },
          child: Container (
            margin:  EdgeInsets.all(8),

            child: CustomScrollView(

            slivers: [
            SliverToBoxAdapter(

            child: Column(
            children: [

             Padding(padding: EdgeInsets.all(2),child: HeaderName(headerName: "Latest")),
                Container(
                margin: const EdgeInsets.only(right: 0),
                height: 500,
                width: double.infinity,
                child: ListView.builder(
                itemCount: posts.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                return SimpleCardNews(post: posts[index],postLoading: postLoading,);
                },
                ),
                ),
               Padding(padding: EdgeInsets.all(6),child: HeaderName(headerName: "For You")),

            ],
                ),
                ),
                SliverList(
                delegate: SliverChildBuilderDelegate(
                (context, index) {
                return Container(
                height: 500,
                margin: const EdgeInsets.fromLTRB(4,4,2,4),
                child: SimpleCardNews(post: posts[index],postLoading: postLoading,),
                );
                },
                childCount: posts.length,
                ),
                ),
                ],
                ),
          ),
        )
    );

  }
}
