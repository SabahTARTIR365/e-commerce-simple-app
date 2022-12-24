import 'package:firbase_app_test/customer/views/confirm_order_screen.dart';
import 'package:firbase_app_test/customer/views/customer_home_screen.dart';
import 'package:firbase_app_test/utils.dart';
import 'package:flutter/material.dart';

import '../../app_router/app_router.dart';
import '../../auth/widgets/custom_button.dart';
import 'cart_screen.dart';


class OrderSuccessScreen extends StatelessWidget {
  const OrderSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.white.withOpacity(0.2),
        elevation: 0,
        leading: IconButton(
          onPressed: () { AppRouter.appRouter.goToWidgetAndReplace(ConfirmOrderScreen()); },
          icon: Icon(Icons.arrow_back_outlined,color: Colors.grey,),),
        title: Row(
          children: [
            SizedBox(width: 60,),
            Text(
                "Order Success ",
                style: SafeGoogleFont ('Muli',
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,)
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height:  MediaQuery.of(context).size.height* 0.04),
          Image.asset(
            "assets/images/success.png",
            height: MediaQuery.of(context).size.height * 0.4, //40%
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.08),
          Text(
            "Order Success",
            style: SafeGoogleFont('muli',
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            " Your packet will send to your\n address, thanks for order!",
            style: SafeGoogleFont('muli',
              fontSize: 18,
              fontWeight: FontWeight.w300,
              color: Colors.black,
            ),
          ),

          Spacer(),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: CustomButton(
              text: "Back to home",
              press: () {
               AppRouter.appRouter.goToWidgetAndReplace(CustomerHomeScreen());
              },
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
