import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils.dart';

class SearchWidget extends StatelessWidget
{
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
   return Container(
     width: MediaQuery.of(context).size.width*0.6,
     decoration: BoxDecoration(
       color: Color(0xFF979797).withOpacity(0.1),
       borderRadius: BorderRadius.circular(15),),
     child: TextField(
          onChanged: (value) => print(value),
         style: SafeGoogleFont (
         'Muli',
         fontWeight: FontWeight.w500,
         color: Color(0xff757575),),
          decoration: const InputDecoration(
             contentPadding: EdgeInsets.symmetric(
               horizontal: 20,
               vertical:15),
           border: InputBorder.none,
           focusedBorder: InputBorder.none,
           enabledBorder: InputBorder.none,
           hintText: "Search product",
           prefixIcon: Icon(Icons.search)),
     ),
   );
  }


}