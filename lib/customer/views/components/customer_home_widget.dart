import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_app_bar.dart';

class CustomerHomeWidget extends StatelessWidget
{
  const CustomerHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
   return Container(
     width: MediaQuery.of(context).size.width,
     color:   Colors.blue,
     child: SingleChildScrollView(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.end,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           CustomAppBar(),
           Text("hi"),

         ],
       ),),
   );
  }

}