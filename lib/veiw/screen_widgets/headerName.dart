import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import '../screens/sigle_posts_screen.dart';

class HeaderName extends StatelessWidget {
  final String headerName;
  const HeaderName({super.key,required this.headerName});


  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(headerName,
            style: GoogleFonts.gelasio(
    textStyle:
    TextStyle(color: Theme.of(context).appBarTheme.foregroundColor, fontSize: 22, letterSpacing: 0.6)),
          ),
          const Spacer(),

           OutlinedButton(
             style: Theme.of(context).outlinedButtonTheme.style,
            onPressed: (){
              if(headerName =="Latest"){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SinglePostsScreen()));

              }
            },


            child: const Text('See All'),

          ),
          const SizedBox(height: 40,),
        ]

    );
  }
}