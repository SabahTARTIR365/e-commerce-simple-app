import 'package:flutter/material.dart';

import '../../utils.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);
  final String? text;
  final Function? press;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height*0.08,
      margin: EdgeInsets.all(20),
      child: TextButton(
        style: TextButton.styleFrom(
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          primary: Colors.white,
          backgroundColor:Color(0xFFFF7643),
        ),
        onPressed: press as void Function()?,
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: SafeGoogleFont (
            'Muli',
            fontSize: 18,
            fontWeight: FontWeight.w600,
            //height: 1.2575*ffem/fem,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
