import 'package:flutter/material.dart';
import 'single_category_screen.dart';

import '../../functions/getData.dart';
import '../../models/category.dart';
import 'package:dio/dio.dart';
import 'package:x2/api/api_constans.dart';


class CategoryListPage extends StatefulWidget {
  const CategoryListPage({super.key});

  @override
  State<CategoryListPage> createState() => _CategoryListPageState();
}

class _CategoryListPageState extends State<CategoryListPage> {


  @override
  Future<void> fetchCat() async {
    List? items = await getData(baseUrlEmbedded, categoriesEndPoint,
        (json) => Categories.fromJson(json));
    if (mounted) {
      setState(() {
        categories = List.from(items);
      });
    }
  }

  @override
  void initState() {
    super.initState();

    fetchCat();

  }

  @override
  void dispose() {
    // Cancel ongoing asynchronous operations when the widget is disposed.
    cancelToken.cancel("Widget disposed");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SingleChildScrollView(
          child: SizedBox(
            height:600,
            child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {

                  return  Container(
                    margin: const EdgeInsets.all(10),

                      height: 60,
                      child: ListTile(







                        title:Align(
                          alignment: Alignment.center,
                          child: Text(categories[index].name.toString(),style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        ),



                        selectedTileColor:Colors.black,

                          onTap:(){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SingleCategoryScreen(category: categories[index],)));
                          },


                      ),
                    );

                }),
          ),
        )
      ],
    );
  }
}
