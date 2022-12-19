import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils.dart';

class DiscountWidget extends StatelessWidget
{
  const DiscountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 90,
    width: MediaQuery.of(context).size.width*0.9,
    margin: EdgeInsets.all(15),
    padding: EdgeInsets.symmetric(
      horizontal: 20,
      vertical: 15,
    ),
    decoration: BoxDecoration(
      color: Color(0xFF4A3298),
      borderRadius: BorderRadius.circular(20),
    ),
    child:  Text.rich(
      TextSpan(
        style: TextStyle(color: Colors.white),
        children: [
          TextSpan(text: "A Summer Surpise\n",
          style: SafeGoogleFont (
            'Muli',
            fontWeight: FontWeight.w400,
            color: Color(0xffffffff),),),
          TextSpan(
            text: "Cashback 20%",
            style: SafeGoogleFont (
            'Muli',
              fontSize: 28,
              fontWeight: FontWeight.w700,
            ),

          ),
        ],
      ),
    ),
  );
  }
}