import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../data_repositories/constant.dart';
import '../../providers/customer_provider.dart';

class CustomBottomNavBar extends StatelessWidget
{
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CustomerProvider>(
        builder: (context, provider, index)
    {
      return Container(
        decoration: const BoxDecoration(
           borderRadius: BorderRadius.only(
              topRight: Radius.circular(24), topLeft: Radius.circular(24)),
           boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 10),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(24),
            topLeft: Radius.circular(24),
          ),

          child: BottomNavigationBar(
            //add background color
            backgroundColor: PrimaryColor,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/Shop Icon.svg"
                  ,
                  color: provider.selectedIndex == 0 ? PrimaryColor : Colors.blueGrey,),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/Heart Icon.svg",
                  color: provider.selectedIndex  == 1 ? PrimaryColor : Colors.blueGrey,),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/Chat bubble Icon.svg",
                  color: provider.selectedIndex  == 2 ? PrimaryColor : Colors.blueGrey,),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: SvgPicture.asset("assets/icons/User Icon.svg",
                  color: provider.selectedIndex  == 3 ? PrimaryColor : Colors.blueGrey,),
                label: '',
              ),
            ],
            currentIndex: provider.selectedIndex ,
            selectedItemColor: PrimaryColor,
            onTap:provider.onItemTapped,
          ),
        ),
      );
    });
  }

}