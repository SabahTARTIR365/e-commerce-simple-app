import 'package:firbase_app_test/customer/views/components/profile_page.dart';
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
*/
class CustomerHomeScreen extends StatelessWidget
{
   CustomerHomeScreen({super.key});

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body:Consumer<CustomerProvider>(
             builder: (context, provider, index)
                { return
                  Container(child:
                        _widgetBottomNavBarOptions.elementAt(provider.selectedIndex),);}),
      bottomNavigationBar: CustomBottomNavBar(),
    );
  }


  final _widgetBottomNavBarOptions = [
    CustomerHomeWidget(),
    Text('Screen2'),
    Text('Screen3'),
    ProfilePage(),
  ];




}