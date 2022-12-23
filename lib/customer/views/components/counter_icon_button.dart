import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CounterIconButton extends StatelessWidget {

  final String icon;
  final int numOfItem;
  final GestureTapCallback onPress;

  const CounterIconButton({super.key, required this.icon, required this.numOfItem, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Badge(
      showBadge: numOfItem==0?false:true,
      badgeColor:  Color(0xffFF4848),
      badgeContent: Text('${numOfItem}',style:TextStyle(color: Colors.white) ,),//numofitem
      child:Container(
          height: MediaQuery.of(context).size.width * 0.12,
          width: MediaQuery.of(context).size.width * 0.12,
          child: FloatingActionButton(
              heroTag: null,
              backgroundColor:Color(0xFFF1F1F3),
              onPressed: onPress,
              child: SvgPicture.asset(icon))),
    );

  }



}