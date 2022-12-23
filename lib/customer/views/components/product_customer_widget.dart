import 'package:firbase_app_test/admin/models/product.dart';
import 'package:firbase_app_test/app_router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../admin/views/screens/product_details_screen.dart';
import '../../../data_repositories/constant.dart';
import '../../../utils.dart';

class ProductCustomerWidget extends StatelessWidget {
  Product product;
  ProductCustomerWidget(this.product, {super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.fromLTRB(30, 10, 0, 0),
      child: InkWell(
          onTap: () {
            AppRouter.appRouter.goToWidgetAndReplace(ProductDetailsScreen(product: product,));
          },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
            Expanded(
              child: Row(
                children: [
                  Text(product.price,
                      style: SafeGoogleFont ('Muli',
                        fontWeight: FontWeight.w700,
                        color: PrimaryColor,),
                      textAlign: TextAlign.start),
                 Spacer(),
                  Expanded(child:
                  InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color:PrimaryColor.withOpacity(0.15),/* product.isFavourite
                            ? PrimaryColor.withOpacity(0.15)
                            : Colors.grey.withOpacity(0.1),*/
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset(
                        "assets/icons/Heart Icon_2.svg",
                        color:Color(0xFFFF4848)/* product.isFavourite
                            ? Color(0xFFFF4848)
                            : Color(0xFFDBDEE4),*/
                      ),
                    ),
                  ),),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
