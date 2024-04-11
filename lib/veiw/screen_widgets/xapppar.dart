import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:x2/constants/color_constants.dart';

class XAppar extends StatelessWidget implements PreferredSizeWidget{
   final String? title;
  const XAppar({super.key, this.title,});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).appBarTheme.backgroundColor  ,
      elevation: 0,
      title:  Text(title ?? 'X-NewsApp',style: GoogleFonts.abrilFatface(
          textStyle:
          const TextStyle(color:Colors.white, fontSize: 25, letterSpacing: 0.6)),),
      centerTitle: true,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            )),
        // IconButton(
        //     onPressed: () {},
        //     icon: const Icon(
        //       Icons.add,
        //       color: Colors.black,
        //     )),
      ],

    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
