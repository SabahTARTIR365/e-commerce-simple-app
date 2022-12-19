import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../utils.dart';

class SliderCard extends StatelessWidget
{
  final String imagePath;
  final String title;

  const SliderCard({super.key, required this.imagePath, required this.title});
  @override
  Widget build(BuildContext context) {
  return
    SizedBox(
      width:MediaQuery.of(context).size.width*0.95,
      child:
      ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child:
          Stack(
            children: [
              Image.network(
               imagePath,
                width: MediaQuery.of(context).size.width*0.95,
                //  height: 150,
                fit: BoxFit.cover,),

              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF343434).withOpacity(0.4),
                      Color(0xFF343434).withOpacity(0.15),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal:(15.0),
                  vertical: (10),
                ),
                child: Text.rich(
                  TextSpan(
                    style: SafeGoogleFont (
                    'Muli',
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                    children: [
                      TextSpan(
                        text: "${title}\n",
                          style: SafeGoogleFont (
                            'Muli',
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          )
                      ),
                      TextSpan(text: "Visit our website here!")
                    ],
                  ),
                ),
              ),
            ],

          )
      ),
    );

  ;
  }

}