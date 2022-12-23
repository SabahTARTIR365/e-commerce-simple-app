import 'dart:developer';


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import '../../providers/admin_provider.dart';

class ProductWidget extends StatelessWidget {
  Product product;
  ProductWidget(this.product);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return InkWell(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black, width: 2)),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(13)),
                  child: SizedBox(
                      width: double.infinity,
                      height: 170,
                      child: Image.network(
                        product.imageUrl,
                        fit: BoxFit.cover,
                      )),
                ),
                Positioned(
                    right: 15,
                    top: 10,
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                Provider.of<AdminProvider>(context,
                                    listen: false).deleteProduct(product);

                              }, icon: Icon(Icons.delete)),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                Provider.of<AdminProvider>(context,
                                    listen: false)
                                    .goToEditProductPage(product);


                              }, icon: Icon(Icons.edit)),
                        ),
                      ],
                    ))
              ],
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Product Name' + ': ' + product.name,
                    ),
                    Text(
                      'Product Price' + ': \$' + product.price,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
