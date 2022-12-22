import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../utils.dart';

class DashboardWidget extends StatelessWidget {

  final String label;
  final GestureTapCallback onPress;

  const DashboardWidget ({super.key, required this.label, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return       Expanded(
        child: InkWell(
          onTap: onPress,
          child: Container(
            width: MediaQuery.of(context).size.width*0.5,
            height: 200 ,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient:  LinearGradient(
                colors: [
                  const Color(0xff4A3298),//.withOpacity(0.6),
                  const Color(0xFF412A8D).withOpacity(0.7),
                ],
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              label,
              style: SafeGoogleFont ('Muli',
                  fontSize: 21, fontWeight: FontWeight.w500,color: Colors.white),
            ),
          ),
        ));
  }



}