import 'package:firbase_app_test/admin/providers/admin_provider.dart';
import 'package:firbase_app_test/admin/views/components/category_widget.dart';
import 'package:firbase_app_test/admin/views/screens/add_category.dart';
import 'package:firbase_app_test/app_router/app_router.dart';
import 'package:firbase_app_test/data_repositories/constant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils.dart';

class AllCategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          backgroundColor:  Colors.white.withOpacity(0.2),
          foregroundColor:Colors.grey,
          elevation: 0,
          title: Text('All Categories',
              style: SafeGoogleFont ('Muli',
                fontSize: 23,
                fontWeight: FontWeight.w500,
                color: Colors.grey,)),
         actions: [
           IconButton(
              onPressed: () {
                AppRouter.appRouter.goToWidget(AddNewCategory());
              },
              icon: Icon(Icons.add),color: PrimaryColor,)
        ],

      ),






      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return provider.allCategories == null
            ? Center(
                child: Text('No Categories Found'),
              )
            : ListView.builder(
                itemCount: provider.allCategories!.length,
                itemBuilder: (context, index) {
                  return CategoryWidget(provider.allCategories![index]);
                });
      }),
    );
  }
}
