// ignore_for_file: file_names, must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/modules/products/review_cart/review_cart.dart';
import 'package:food_app/modules/products/wishlist/wishlist_controller.dart';
import 'package:food_app/modules/theme/theme_provider.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/count.dart';
import 'package:provider/provider.dart';

class ProductOverView extends StatefulWidget {
  ProductOverView({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.price,
    required this.productId,
    this.productUnitList,
  });
  final String imageUrl;
  final String productName;
  final String price;
  final String productId;
  List<dynamic>? productUnitList;

  @override
  State<ProductOverView> createState() => _ProductOverViewState();
}

class _ProductOverViewState extends State<ProductOverView> {
  int val = 1;
  bool isfavourite = false;

  getWishListData() async {
    await FirebaseFirestore.instance
        .collection("WishList")
        .doc("123")
        .collection("YourWishList")
        .doc(widget.productId)
        .get()
        .then((value) {
      if (value.exists) {
        setState(() {
          isfavourite = value.get("wishlist");
        });
      }
    });
  }

  @override
  void initState() {
    getWishListData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themePreferenceMode =
        Provider.of<ThemeController>(context, listen: false);
    double h = MediaQuery.of(context).size.height;
    final WishListController wishListController =
        Provider.of<WishListController>(context, listen: false);
    return Scaffold(
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Container(
              color: themePreferenceMode.isDarkMode
                  ? AppColors.kPrimarydark
                  : Colors.black,
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isfavourite = !isfavourite;
                      });
                      if (isfavourite) {
                        wishListController.addWishListData(
                            wishListId: widget.productId,
                            wishListImage: widget.imageUrl,
                            wishListName: widget.productName,
                            wishListPrice: widget.price,
                            wishListQuentity: "2");
                      }
                    },
                    child: Icon(
                      isfavourite
                          ? Icons.favorite
                          : Icons.favorite_border_outlined,
                      color: isfavourite ? Colors.red : AppColors.kwhiteColor,
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  const Text(
                    "Add to wishlist",
                    style: TextStyle(
                      color: AppColors.kwhiteColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ReviwCart()));
              },
              child: Container(
                color: AppColors.kappBarColorlight,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.card_travel,
                      color: AppColors.kblackColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text("Go to Cart",
                        style: TextStyle(
                          color: AppColors.kblackColor,
                        )),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      appBar: AppBar(
        title: const Text("Product Overview"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(widget.productName.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              Text("\$${widget.price}",
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.green)),
              Container(
                margin: EdgeInsets.only(top: h / 70),
                height: h / 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(widget.imageUrl))),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text("About this Product",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Radio(
                    activeColor: Colors.blue,
                    value: 1,
                    groupValue: val,
                    onChanged: (value) {
                      setState(() {
                        val = value!;
                      });
                    },
                  ),
                  Text("\$${widget.price}"),
                  Count(
                    cartId: widget.productId,
                    cartImage: widget.imageUrl,
                    cartName: widget.productName,
                    cartPrice: widget.price,
                    cartQuentity: '5',
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Text("About this Product",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 5,
              ),
              const Text(
                  "Flutter is a mobile app development platform created by Google. It allows developers to create web, desktop, and cross-platform apps that run on Android and iOS devices. Flutter uses a reactive programming language called Dart, making development faster and easier than traditional methods"),
            ],
          ),
        ),
      ),
    );
  }
}
