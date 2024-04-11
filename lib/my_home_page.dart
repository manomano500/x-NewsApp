import 'package:flutter/material.dart';
import 'package:x2/constants/color_constants.dart';
import 'package:x2/veiw/categories/category_list_page.dart';
import 'package:x2/veiw/screen_widgets/x_drawer.dart';

import 'package:x2/veiw/screen_widgets/xapppar.dart';
import 'package:x2/veiw/screens/home_screen.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  int _currentIndex = 0;
  late PageController _pageController;

  @override


  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:const XAppar(),


    drawer: const XDrawer(),
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: const [
          HomeScreen(),
          CategoryListPage(),
        ],
      ),
      bottomNavigationBar:  BottomNavigationBar(
        backgroundColor: AppColors.burgundy,

        currentIndex: _currentIndex,
        onTap: (index) {
          _pageController.jumpToPage(index);
        },
        items: const [

          BottomNavigationBarItem(
            icon:  Icon(Icons.home_filled),
            label: 'Home'

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
              label: 'Categories',


          ),
        ],
      ),
    );
  }
}