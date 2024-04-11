import 'package:flutter/material.dart';
import 'package:x2/my_home_page.dart';
import 'package:x2/constants/app_theme.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();


  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});
  // ThemeProvider themeChangeProvider = ThemeProvider();
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(


      // theme: ThemeData.from(colorScheme: const ColorScheme.light()),
      // theme: Styles.themeData(themeChangeProvider.getDarkTheme, context),
      theme: Themes.appTheme,
      title: 'X-NewsApp',
     home:  const MyHomePage(),

    );
  }
}
