import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget
{
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
     // padding:  EdgeInsets.fromLTRB(0, 20, 0, 5),//EdgeInsets.only(top: 10),
        child: Row(children: [
        Container(
        width: MediaQuery.of(context).size.width*0.6,
          decoration: BoxDecoration(
            color: Color(0xFF979797).withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          child: TextField(
            onChanged: (value) => print(value),
            decoration: const InputDecoration(
                /*contentPadding: EdgeInsets.symmetric(
                    //horizontal: getProportionateScreenWidth(20),
                    vertical: getProportionateScreenWidth(9)),*/
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search product",
                prefixIcon: Icon(Icons.search)),
          ),
        ),



        ],),
    );
  }
  @override
  Size get preferredSize => AppBar().preferredSize;

}