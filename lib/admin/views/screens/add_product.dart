
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../auth/components/custom_textfield.dart';
import '../../../data_repositories/constant.dart';
import '../../../utils.dart';
import '../../providers/admin_provider.dart';

class AddNewProduct extends StatelessWidget {
  String catId;
  AddNewProduct(this.catId);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.grey,
        backgroundColor:  Colors.white.withOpacity(0.2),
        elevation: 0,
        title :Text(
            "New Product",
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
            key: provider.addProductKey,
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
                        ? const Center(
                            child: Icon(Icons.camera),
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
                  controller: provider.productNameController,
                  label: 'Product name',
                  validation: provider.requiredValidation,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  svgIcon: "assets/icons/white.svg",
                  controller: provider.productDescriptionController,
                  label: 'Product Description',
                  validation: provider.requiredValidation,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  svgIcon: "assets/icons/white.svg",
                  controller: provider.productPriceController,
                  label: 'Product Price',
                  validation: provider.requiredValidation,
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      provider.addNewProduct(catId);
                    },
                    child: const Text('Add New Product'),
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
