import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../admin/views/components/discount_widget.dart';
import 'custom_app_bar.dart';

class CustomerHomeWidget extends StatelessWidget
{
  const CustomerHomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
   return Container(
     width: MediaQuery.of(context).size.width,
     //color:   Colors.blue,
     child: SingleChildScrollView(
       child: Column(
         children: const [
           SizedBox(height: 35,),
           CustomAppBar(),
           SizedBox(height: 30,),
           DiscountWidget(),


         ],
       ),),
   );
  }

}