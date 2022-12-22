import 'package:firbase_app_test/admin/models/product.dart';
import 'package:flutter/material.dart';

import '../../../data_repositories/constant.dart';
import '../../../utils.dart';

class ProductCustomerWidget extends StatelessWidget {
  Product product;
  ProductCustomerWidget(this.product);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
          onTap: () {},
        child: Column(
          children: [

            SizedBox(
              height: 135,
              width: 135,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),

            SizedBox(height: 5),
            Text(product.name,
                style: SafeGoogleFont ('Muli',
                  fontWeight: FontWeight.w500,
                  color: Color(0xff000000),),
                textAlign: TextAlign.center),
            Text(product.price,
                style: SafeGoogleFont ('Muli',
                  fontWeight: FontWeight.w700,
                  color: PrimaryColor,),
                textAlign: TextAlign.start),

          ],
        ),
      ),
    );



    /*Container(
      margin: const EdgeInsets.all(25),
      child: Column(
        children: [
        Expanded(flex: 2,
          child: ClipRRect(
            borderRadius:  BorderRadius.circular(10),
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                )),
        ),
          const SizedBox(
            width: 5,
          ),
          Text(product.name),
          Text(product.price)
        ],
      ),
    );*/

     /* Container(
       //height: 400,
        margin: EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.black, width: 2)),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(15),bottom: Radius.circular(15)),
                child: SizedBox(
                    width: double.infinity,
                  height: 100,
                    child: Image.network(
                      product.imageUrl,
                      fit: BoxFit.cover,
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                   Text(product.name,
                        style: SafeGoogleFont (
                          'Muli',
                          fontSize:18,
                          fontWeight: FontWeight.w400,)),
                    Text(product.price,
                      style: SafeGoogleFont (
                        'Muli',
                      fontSize:18,
                      fontWeight: FontWeight.w600,
                      color: PrimaryColor,
                    ),),
                  ]),
            ),
          ],
        ),
      );*/
  }
}
