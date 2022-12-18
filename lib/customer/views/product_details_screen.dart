import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../data_repositories/constant.dart';
import '../providers/customer_provider.dart';
import 'components/custom_app_bar.dart';
import 'components/custom_bottom_nav_bar.dart';
import 'components/customer_home_widget.dart';
/*class ProductDetailsScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     bottomNavigationBar:
     Container(

       //padding: EdgeInsets.fromLTRB(54*fem, 25*fem, 53*fem, 38*fem),
       width: MediaQuery.of(context).size.width,
       decoration: const BoxDecoration (
         color: Color(0xffffffff),
         borderRadius: BorderRadius.only (
           topLeft: Radius.circular(40),
           topRight: Radius.circular(40),
         ),
          boxShadow: [
           BoxShadow(
             color: Color(0x26d9d9d9),
             offset: Offset(0, -15),
             blurRadius: 10,
           ),
         ],
       ),
       child: Row(
         crossAxisAlignment: CrossAxisAlignment.center,
         children: [
           Container(
             // homeactiveU3t (0:1544)
             width: 22*fem,
             height: 30*fem,
             child: Image.asset(
               'assets/page-1/images/home-active.png',
               width: 22*fem,
               height: 30*fem,
             ),
           ),
           SizedBox(
             width: 60*fem,
           ),
           Container(
             // hearticonXXx (0:1553)
             width: 22*fem,
             height: 20*fem,
             child: Image.asset(
               'assets/page-1/images/heart-icon-zPc.png',
               width: 22*fem,
               height: 20*fem,
             ),
           ),
           SizedBox(
             width: 60*fem,
           ),
           Container(
             // chatbubbleiconEBU (0:1556)
             width: 22*fem,
             height: 20*fem,
             child: Image.asset(
               'assets/page-1/images/chat-bubble-icon-pxJ.png',
               width: 22*fem,
               height: 20*fem,
             ),
           ),
           SizedBox(
             width: 60*fem,
           ),
           Container(
             // usericon93Y (0:1542)
             width: 22*fem,
             height: 22*fem,
             child: Image.asset(
               'assets/page-1/images/user-icon-kV8.png',
               width: 22*fem,
               height: 22*fem,
             ),
           ),
         ],
       ),
     ),

   );
  }

}
*/
class CustomerHomeScreen extends StatelessWidget
{
   CustomerHomeScreen({super.key});

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // appBar: CustomAppBar(),
         body:   Consumer<CustomerProvider>(
             builder: (context, provider, index)
                { return Container(
                  //color: Colors.orangeAccent,
                  child:
                   Center(child:
                   _widgetBottomNavBarOptions.elementAt(provider.selectedIndex),),);}),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }


  final _widgetBottomNavBarOptions = [
    CustomerHomeWidget(),
    Text('Screen2'),
    Text('Screen3'),
    Text('Screen4'),
  ];




}