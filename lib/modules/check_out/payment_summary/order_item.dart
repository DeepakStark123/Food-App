// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:food_app/modules/products/review_cart/review_cart_model.dart';

class OrderItem extends StatelessWidget {
  final ReviewCartModel? e;
  const OrderItem({this.e});
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(
        e!.cartImage,
        width: 60,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
           e!.cartName,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            e!.cartProductUnit,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Text(
            "\$${e!.cartPrice}",
            
          ),
        ],
      ),
      subtitle: Text(e!.cartQuentity.toString()),
    );
  }
}
