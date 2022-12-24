
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../auth/components/custom_textfield.dart';
import '../../../utils.dart';
import '../../models/category.dart';
import '../../providers/admin_provider.dart';

class EditCategory extends StatelessWidget {
  Category category;
  EditCategory(this.category);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.white.withOpacity(0.2),
        elevation: 0,
        title :Text(
            "Update Category",
            style: SafeGoogleFont ('Muli',
              fontSize: 23,
              fontWeight: FontWeight.w500,
              color: Colors.grey,)
        ),
      ),


      body: Consumer<AdminProvider>(builder: (context, provider, w) {
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: provider.categoryFormKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    provider.pickImageForCategory();
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey,
                    child: provider.imageFile == null
                        ? Image.network(
                            category.imageUrl,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            provider.imageFile!,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  svgIcon: "assets/icons/white.svg",
                  controller: provider.catNameArController,
                  label: 'Category Arabic name',
                  validation: provider.requiredValidation,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  svgIcon: "assets/icons/white.svg",
                  controller: provider.catNameEnController,
                  label: 'Category English name',
                  validation: provider.requiredValidation,
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      provider.updateCategory(category);
                    },
                    child: const Text('Update Category'),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
