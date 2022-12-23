import 'package:firbase_app_test/admin/models/product.dart';
import 'package:flutter/material.dart';
import '../../../data_repositories/constant.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          color: Color(0xFFF5F6F9),
          child: SizedBox(
            width: 88,
            height: 100,
            child: ClipRRect(

                borderRadius: BorderRadius.circular(15),

              child:  Image.network(product.imageUrl,fit: BoxFit.cover,),
            ),
          ),
        ),
        SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.name,
              style: TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "${product.price}",
                style: TextStyle(
                    fontWeight: FontWeight.w600, color: PrimaryColor),
              ),
            )
          ],
        )
      ],
    );
  }
}
