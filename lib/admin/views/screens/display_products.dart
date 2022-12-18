
import 'package:firbase_app_test/admin/views/screens/add_product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_router/app_router.dart';
import '../../providers/admin_provider.dart';
import '../components/product_widget.dart';
import 'add_category.dart';

class AllProductsScreen extends StatelessWidget {
  String catId;
  AllProductsScreen(this.catId);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                AppRouter.appRouter.goToWidget(AddNewProduct(catId));
              },
              icon: Icon(Icons.add))
        ],
        title: Text('All Products'),
      ),
      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allProducts == null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: provider.allProducts!.length,
                itemBuilder: (context, index) {
                  return ProductWidget(provider.allProducts![index]);
                });
      }),
    );
  }
}
