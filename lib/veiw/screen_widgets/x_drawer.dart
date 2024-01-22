import 'package:flutter/material.dart';

import '../../api/api_constans.dart';
import '../../api/getData.dart';
import '../../models/pages.dart';
import 'page_screen.dart';

class XDrawer extends StatefulWidget {
  const XDrawer({super.key});

  @override
  State<XDrawer> createState() => _XDrawerState();
}

class _XDrawerState extends State<XDrawer> {
  int? _selectedIndex =0;



  @override

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchPages();

    super.initState();


    // fetchMedia();
  }

  Future<void> fetchPages() async {

    List? items = await getData( baseUrlEmbedded , pagesEndpoint,  (json) => Pages.fromJson(json));
    setState(() {
      pages = List.from(items);

    });
    }

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: Column(
        // Important: Remove any padding from the ListView.

        children: [
          Text('X-NewsApps',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),



          Expanded(
            child: ListView.builder(

              itemCount: pages.length,
              itemBuilder: (context,index){
                return InkWell(
                    onTap:(){
                      _onItemTapped(0);
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>PageScreen(page: pages[index],)));
                    },
                  child: ListTile(

                    title: Text(pages[index].title.toString()),
                    selected: _selectedIndex == 0,

                  ),
                );
              },

            ),
          ),

        ],
      ),
    );
  }
}
