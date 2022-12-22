import 'package:firbase_app_test/admin/models/category.dart';
import 'package:firbase_app_test/admin/providers/admin_provider.dart';
import 'package:firbase_app_test/customer/views/components/product_customer_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AllProductsScreen extends StatelessWidget {
  Category category;
  AllProductsScreen(this.category);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(category.nameEn + " Products"),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allProducts == null
            ? const Expanded(
                child: Center(
                child: CircularProgressIndicator(),
              ))
            :/* ListView.builder(
                itemCount: provider.allProducts?.length ?? 0,
                itemBuilder: (context, index) {
                  return ProductCustomerWidget(provider.allProducts![index]);
                })*/
        GridView.builder(
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5,
                crossAxisSpacing: 5),
            itemCount:provider.allProducts?.length ?? 0,
            itemBuilder: (context, index) {
              return  ProductCustomerWidget(provider.allProducts![index]);
            });
      }),
    );
  }
}
