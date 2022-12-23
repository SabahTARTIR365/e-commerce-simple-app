import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
      body: /*Padding(
        padding:
        EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: demoCarts.length,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Dismissible(
              key: Key(demoCarts[index].product.id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  demoCarts.removeAt(index);
                });
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
              child: CartCard(cart: demoCarts[index]),
            ),
          ),
        ),
      ),*/Column(),
      bottomNavigationBar: const CheckoutWidget(),
    );
  }
}