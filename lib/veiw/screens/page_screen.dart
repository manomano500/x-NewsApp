import 'package:flutter/material.dart';
import 'package:x2/veiw/screen_widgets/xapppar.dart';

import '../../models/pages.dart';
import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';


class PageScreen extends StatefulWidget {
  final Pages page;
  // final String url = 'http://localhost/x/index.php/contact-us/';

  const PageScreen({super.key,required this.page,});

  @override
  State<PageScreen> createState() => _PageScreenState();
}

class _PageScreenState extends State<PageScreen> {

  @override
  Widget build(BuildContext context) {

    return   Scaffold(
      appBar: XAppar(title: widget.page.title,),
      body:  SingleChildScrollView(
        child:  Container(
          margin: const EdgeInsets.all(10),
            child:  HtmlWidget(widget.page.content.toString()),
                  ),

      ) );
  }
}
