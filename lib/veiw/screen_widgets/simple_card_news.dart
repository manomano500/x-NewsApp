import 'package:flutter/material.dart';


import '../../api/removeAllHtmlTags.dart';
import '../../constants/size_constants.dart';
import '../../models/post.dart';
import '../categories/single_category_screen.dart';
import '../screens/single_news_screen.dart';
import 'app_button.dart';
///small card
class SimpleCardNews extends StatelessWidget implements PreferredSizeWidget{
   final Post post;
   final bool postLoading;
  const SimpleCardNews( {super.key, required this.post, required this.postLoading,});

  @override
  Widget build(BuildContext context) {

    return Card(
        shadowColor:Colors.black,
        elevation: 0,
        shape: const RoundedRectangleBorder(
            borderRadius:
            BorderRadius.all(Radius.circular(Sizes.dimen_10))),
        margin: const EdgeInsets.fromLTRB(
            Sizes.dimen_10, Sizes.dimen_8, Sizes.dimen_8, 0),

        child:   postLoading==true?
        const SizedBox(
            height: 250,
            width: 300,
            child: Center(child: CircularProgressIndicator())
        ):

        SizedBox(
          height: 490,

          width: MediaQuery.of(context).size.width-80,
          child: Column(



              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[

                ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(Sizes.dimen_10),
                        topRight: Radius.circular(Sizes.dimen_10)),
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
                            child: Icon(Icons.broken_image_sharp),
                          ),
                        );
                      },
                    )),
               Padding(
                 padding: EdgeInsets.all(14),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     InkWell(
                       onTap: () {
                         Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleCategoryScreen(category: post.categories! )));
                       },

                       child: GestureDetector(



                         child: Text(post.category_name!,
                           style: const TextStyle(
                             color: Colors.blue,
                             fontSize: Sizes.dimen_10 ,
                             decoration: TextDecoration.underline,
                           ),
                         ),
                       ),
                     ),

                     Text(
                       removeAllHtmlTags( post.title.toString()),
                       maxLines: 2,
                       style: const TextStyle(
                           color: Colors.black87,
                           fontSize: Sizes.dimen_16,
                           fontWeight: FontWeight.w500),
                     ),
                     Text(
                       removeAllHtmlTags(post.content!.split(' ').take(25).join(' ').toString()),
                       maxLines: 3,
                       style: const TextStyle(
                           color: Colors.black54,
                           fontSize: Sizes.dimen_14),
                     ),

                   ],
                 ),
               ),
                Padding(
                  padding: EdgeInsets.only(bottom: 12),
                  child: OutlinedButton(onPressed: () {  }, child: AppButton(onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleNewsScreen(post: post,)));
                  }, labelText: 'Read More',),

                  ),
                )
              ]),
        ));
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
