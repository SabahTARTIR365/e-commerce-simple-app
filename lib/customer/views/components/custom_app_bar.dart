import 'package:badges/badges.dart';
import 'package:firbase_app_test/customer/views/components/search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'counter_icon_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget
{
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15,),
        const SearchWidget(),
        const SizedBox(width: 15,),
        CounterIconButton(icon: 'assets/icons/Cart Icon.svg', numOfItem: 0,onPress: (){},),
        const SizedBox(width: 15,),
        CounterIconButton(icon: 'assets/icons/Bell.svg', numOfItem: 3,onPress: (){},),
    ],);
  }
  @override
  Size get preferredSize => AppBar().preferredSize;

}