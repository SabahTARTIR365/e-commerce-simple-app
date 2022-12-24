import 'package:firbase_app_test/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../admin/providers/admin_provider.dart';
import '../../../auth/widgets/custom_button.dart';
import '../confirm_order_screen.dart';

class CheckoutWidget extends StatelessWidget {
  const CheckoutWidget ({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    Consumer<AdminProvider>(
    builder: (context, provider, u)
    {
      return Container(
          padding: const EdgeInsets.symmetric(
            vertical: 15,
            horizontal: 30,
          ),
          // height: 174,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(30),
              topRight: Radius.circular(30),
            ),
            boxShadow: [
              BoxShadow(
                offset: Offset(0, -15),
                blurRadius: 20,
                color: Color(0xFFDADADA).withOpacity(0.2),
              )
            ],
          ),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFF5F6F9),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: SvgPicture.asset("assets/icons/receipt.svg"),
                    ),
                    Spacer(),
                    Text("Click down to get your order"),
                    const SizedBox(width: 10),
                    Icon(
                      Icons.arrow_forward_ios,
                      size: 12,
                      color: Color(0xFF757575),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Total:\n",
                        children: [
                          TextSpan(
                            text: "\$ ${provider.getTotalCash()}",
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 190,
                      child: CustomButton(
                        text: "Check Out",
                        press: () { AppRouter.appRouter.goToWidgetAndReplace(ConfirmOrderScreen());},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
    });
  }
}
