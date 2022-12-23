import 'package:badges/badges.dart';
import 'package:firbase_app_test/admin/providers/admin_provider.dart';
import 'package:firbase_app_test/app_router/app_router.dart';
import 'package:firbase_app_test/customer/views/components/search_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../cart_screen.dart';
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
        CounterIconButton(icon: 'assets/icons/Cart Icon.svg',
          numOfItem:0,
          /*Provider.of<AdminProvider>(context, listen: false).cart!.length==null
          ?
          0:
          Provider.of<AdminProvider>(context, listen: false).cart!.length,*/
          onPress: (){ AppRouter.appRouter.goToWidgetAndReplace(CartScreen());
          },),
        const SizedBox(width: 15,),
        CounterIconButton(icon: 'assets/icons/Bell.svg', numOfItem: 3,onPress: (){},),
    ],);
  }
  @override
  Size get preferredSize => AppBar().preferredSize;

}