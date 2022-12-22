import 'package:firbase_app_test/admin/models/category.dart';
import 'package:firbase_app_test/admin/providers/admin_provider.dart';
import 'package:firbase_app_test/customer/views/components/product_customer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils.dart';

class AllProductsScreen extends StatelessWidget {
  Category category;
  AllProductsScreen(this.category);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_sharp,color: Color(0xff757575),)),
                SizedBox(width: 60,),
                Text
                  ( category.nameEn + " Products",
                  style: SafeGoogleFont ('Muli',
                    fontSize: 23,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff757575),),
                ),
              ],
            ),
         provider.allProducts == null
          ? const Expanded(
            child: Center(
            child: CircularProgressIndicator(),
           ))
         :
          Expanded(
            child: Container(
              //margin: EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                 gridDelegate:
                 const SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 2,
                 mainAxisSpacing: 5,
                 crossAxisSpacing: 5),
                 itemCount:provider.allProducts?.length ?? 0,
                  itemBuilder: (context, index) {
                  return Expanded(
                      child: ProductCustomerWidget(provider.allProducts![index]));
        }),
            ),
          )




        ],);
      }),
    );
  }
}
