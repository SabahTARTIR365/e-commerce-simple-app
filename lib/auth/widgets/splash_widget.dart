import 'package:firbase_app_test/utils.dart';
import 'package:flutter/material.dart';



class SplashWidget extends StatelessWidget {
  const SplashWidget({
    Key? key,
    this.text,
    this.image,
  }) : super(key: key);
  final String? text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Text(
          'TOKOTO',
          textAlign: TextAlign.center,
          style: SafeGoogleFont (
            'Muli',
            fontSize: 36,
            fontWeight: FontWeight.w800,
            height: 3,//check
            color: Color(0xffff7643),
          ),
        ),
        Text(
          text!,
          textAlign: TextAlign.center,
          style: SafeGoogleFont (
            'Mulish',
            fontWeight: FontWeight.w400,
            color: Color(0xff757575),
          ),
        ),
       const Spacer(flex: 2),
        Container(
          height: MediaQuery.of(context).size.height*0.3,
          width: MediaQuery.of(context).size.width,
          child: Image.asset(
            image!,
            fit: BoxFit.fitHeight,
          ),
        ),
        //const Spacer(flex: 2),
      ],
    );
  }
}
