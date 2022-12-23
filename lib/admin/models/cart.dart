import 'package:firbase_app_test/admin/models/product.dart';

class Cart {
  final Product product;

  Cart({required this.product});


  Map<String, dynamic> toMap() {
    return {
      'product': product,

    };
  }

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      product: map['product'] ?? '',

    );
  }






}
