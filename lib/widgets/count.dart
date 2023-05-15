// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/modules/products/review_cart/review_cart_controller.dart';
import 'package:food_app/modules/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class Count extends StatefulWidget {
  const Count({
    super.key,
    required this.cartId,
    required this.cartImage,
    required this.cartName,
    required this.cartPrice,
    required this.cartQuentity,
    this.cartProductUnit,
  });
  final String cartId;
  final String cartImage;
  final String cartName;
  final String cartPrice;
  final String cartQuentity;
  final String? cartProductUnit;

  @override
  State<Count> createState() => _CountState();
}

class _CountState extends State<Count> {
  int count = 1;
  bool isAllItemClick = false;
  String cartunit = '';

  getAddAndQuantity() async {
    await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc("123")
        .collection("YourReviewCart")
        .doc(widget.cartId)
        .get()
        .then((value) {
      if (value.exists) {
        if (mounted) {
          setState(() {
            isAllItemClick = value.get("isAdd");
            count = int.parse(value.get("cartQuentity").toString());
            cartunit = value.get("cartProductUnit");
          });
        }
      }
    });
  }

  @override
  void initState() {
    getAddAndQuantity();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themePreferenceMode =
        Provider.of<ThemeController>(context);
    final reviewCartController =
        Provider.of<ReviewCartController>(context);
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
              color: themePreferenceMode.isDarkMode
                  ? Colors.white54
                  : Colors.black54)),
      child: isAllItemClick
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (count == 1) {
                        isAllItemClick = false;
                        reviewCartController
                            .deleteReviewCartData(widget.cartId);
                      } else {
                        count--;
                        reviewCartController.updateReviewCartData(
                          cartId: widget.cartId,
                          cartImage: widget.cartImage,
                          cartName: widget.cartName,
                          cartPrice: widget.cartPrice,
                          cartQuentity: count.toString(),
                          cartProductUnit:  widget.cartProductUnit.toString(),
                        );
                      }
                    });
                  },
                  child: Icon(Icons.remove,
                      size: 12,
                      color: themePreferenceMode.isDarkMode
                          ? Colors.white
                          : Colors.black),
                ),
                Text(
                  count.toString(),
                  style: TextStyle(
                      color: themePreferenceMode.isDarkMode
                          ? Colors.white
                          : Colors.black),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      count++;
                    });
                    reviewCartController.updateReviewCartData(
                      cartId: widget.cartId,
                      cartImage: widget.cartImage,
                      cartName: widget.cartName,
                      cartPrice: widget.cartPrice,
                      cartQuentity: count.toString(),
                      cartProductUnit:  widget.cartProductUnit.toString(),
                    );
                  },
                  child: Icon(Icons.add,
                      size: 12,
                      color: themePreferenceMode.isDarkMode
                          ? Colors.white
                          : Colors.black),
                ),
              ],
            )
          : GestureDetector(
              onTap: () {
                setState(() {
                  isAllItemClick = true;
                  debugPrint("jsdk ad-> ${widget.cartProductUnit}");
                  reviewCartController.addReviewCartData(
                    cartId: widget.cartId,
                    cartImage: widget.cartImage,
                    cartName: widget.cartName,
                    cartPrice: widget.cartPrice,
                    cartQuentity: count.toString(),
                    cartProductUnit: widget.cartProductUnit.toString(),
                  );
                });
              },
              child: Center(
                child: Text(
                  "+ADD",
                  style: TextStyle(
                      color: themePreferenceMode.isDarkMode
                          ? Colors.white54
                          : Colors.black54),
                ),
              ),
            ),
    );
  }
}
