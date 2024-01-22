import 'package:flutter/material.dart';
import 'package:x2/my_home_page.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(


      theme: ThemeData.from(colorScheme: const ColorScheme.light()),

      title: 'X-NewsApp',
     home:  const MyHomePage(),

    );
  }
}