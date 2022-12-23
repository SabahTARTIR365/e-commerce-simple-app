import 'dart:developer';

import 'package:firbase_app_test/app_router/app_router.dart';
import 'package:firbase_app_test/customer/views/customer_home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../admin/providers/admin_provider.dart';
import '../../utils.dart';
import 'components/cart_card.dart';
import 'components/checkout_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.white.withOpacity(0.2),
        elevation: 0,
        leading: IconButton(
          onPressed: () {  AppRouter.appRouter.goToWidgetAndReplace(CustomerHomeScreen()); },
          icon: Icon(Icons.arrow_back_outlined),),
        title: Column(
          children: [
              Text(
              "Your Cart",
              style: SafeGoogleFont ('Muli',
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Colors.black,)
              ),

           /* Text(
              "${demoCarts.length} items",
              style: Theme.of(context).textTheme.caption,
            ),*/
          ],
        ),
      ),
      body: Consumer<AdminProvider>(
         builder: (context, provider, u) {
           provider.getCart();
           print('insid cart button value of cart =');
           print(provider.cart?.length.toString());
          return provider.cart == null
        ? const Center(
           child: CircularProgressIndicator(),)
        : provider.cart!.isEmpty
        ?const  Center(
         child: Text('No Items Found'),)
        :
          Padding(
            padding:
            EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemCount: provider.cart!.length,
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Dismissible(
                  key: Key( provider.cart![index].id.toString()),
                  direction: DismissDirection.endToStart,
                  onDismissed: (direction) {
                    provider.deleteProductFromCart(provider.cart![index]);

                  },
                  background: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        SvgPicture.asset("assets/icons/Trash.svg"),
                      ],
                    ),
                  ),
                  child: CartCard(product: provider.cart![index]),
                ),
              ),
            ),
          );



          },
          ),



    /*
     */
      bottomNavigationBar: const CheckoutWidget(),
    );
  }
}