// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_app/modules/theme/theme_provider.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/count.dart';
import 'package:food_app/widgets/product_unit.dart';
import 'package:provider/provider.dart';

class ItemCard extends StatefulWidget {
  ItemCard({
    super.key,
    required this.imageUrl,
    required this.vegiName,
    required this.price,
    required this.productId,
    this.imageTap,
    this.productUnitList,
    this.loading = false,
  });

  final String imageUrl;
  final String vegiName;
  final String price;
  final String productId;
  final void Function()? imageTap;
  bool loading;
  List<dynamic>? productUnitList;

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  String productUnitDta = '';

  getproduct (){
    setState(() {
      productUnitDta = widget.productUnitList!.first;
    });
  }

  @override
  void initState() {
    getproduct();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final themePreferenceMode =
        Provider.of<ThemeController>(context, listen: false);
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h / 2.6,
      width: 200,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      decoration: BoxDecoration(
          color: themePreferenceMode.isDarkMode
              ? AppColors.kPrimarydark
              : AppColors.kwhiteColor,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: GestureDetector(
              onTap: widget.imageTap,
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(widget.imageUrl))),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
                width: double.maxFinite,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.vegiName.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: themePreferenceMode.isDarkMode
                              ? Colors.white
                              : Colors.black),
                    ),
                    const SizedBox(
                      height: 3,
                    ),
                    Text("${widget.price}\$/50 Grams",
                        style: TextStyle(
                            color: themePreferenceMode.isDarkMode
                                ? Colors.white54
                                : Colors.black54)),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ProductUnit(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return ListView.builder(
                                      itemCount: (widget.productUnitList ==
                                                  null ||
                                              widget.productUnitList!.isEmpty)
                                          ? 0
                                          : widget.productUnitList!.length,
                                      itemBuilder: (context, index) {
                                        return ListTile(
                                          onTap: () {
                                            setState(() {
                                              productUnitDta = widget.productUnitList![index];
                                              Navigator.pop(context);
                                            });
                                          },
                                          title: Text(widget.productUnitList![index]),
                                        );
                                      });
                                },
                              );
                            },
                            title: productUnitDta,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Count(
                          cartId: widget.productId,
                          cartImage: widget.imageUrl,
                          cartName: widget.vegiName,
                          cartPrice: widget.price,
                          cartQuentity: '5',
                          cartProductUnit: productUnitDta,
                        )),
                      ],
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
