// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:food_app/modules/theme/theme_provider.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/count.dart';
import 'package:food_app/widgets/product_unit.dart';
import 'package:provider/provider.dart';

class SingleSearchItem extends StatefulWidget {
  SingleSearchItem({
    super.key,
    required this.productName,
    required this.producImage,
    required this.productPrice,
    required this.productId,
    this.productUnitList,
  });
  final String productName;
  final String producImage;
  final String productPrice;
  final String productId;
  List<dynamic>? productUnitList;

  @override
  State<SingleSearchItem> createState() => _SingleSearchItemState();
}

class _SingleSearchItemState extends State<SingleSearchItem> {
  String productUnitDta = '';

  getproduct() {
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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
          color: themePreferenceMode.isDarkMode
              ? AppColors.kPrimarydark
              : AppColors.kwhiteColor,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColors.kblackColor,
          )),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(widget.producImage),
                  )),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        widget.productName,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text("${widget.productPrice}\$/50 Gram")
                    ],
                  ),

                  ProductUnit(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return ListView.builder(
                              itemCount: (widget.productUnitList == null ||
                                      widget.productUnitList!.isEmpty)
                                  ? 0
                                  : widget.productUnitList!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  onTap: () {
                                    setState(() {
                                      productUnitDta =
                                          widget.productUnitList![index];
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

                  // Container(
                  //   padding: const EdgeInsets.all(10),
                  //   margin: const EdgeInsets.symmetric(horizontal: 10),
                  //   decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(40),
                  //       border: Border.all(
                  //         color: themePreferenceMode.isDarkMode
                  //             ? AppColors.kwhiteColor
                  //             : AppColors.kblackColor,
                  //       )),
                  //   child: Center(
                  //     child:
                  //     // GestureDetector(
                  //     //   onTap: () {
                  //     //     showModalBottomSheet(
                  //     //       context: context,
                  //     //       builder: (context) {
                  //     //         return Wrap(
                  //     //           children: const [
                  //     //             ListTile(
                  //     //               title: Text('50 Grams'),
                  //     //             ),
                  //     //             ListTile(
                  //     //               title: Text('250 Grams'),
                  //     //             ),
                  //     //             ListTile(
                  //     //               title: Text('1 Kg'),
                  //     //             ),
                  //     //           ],
                  //     //         );
                  //     //       },
                  //     //     );
                  //     //   },
                  //     //   child: Row(
                  //     //     mainAxisAlignment: MainAxisAlignment.center,
                  //     //     children: const [
                  //     //       Text("50 Grams"),
                  //     //       Icon(
                  //     //         Icons.arrow_drop_down,
                  //     //       )
                  //     //     ],
                  //     //   ),
                  //     // ),

                  //   ),
                  // )
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                height: 50,
                child: Count(
                  cartId: widget.productId,
                  cartImage: widget.producImage,
                  cartName: widget.productName,
                  cartPrice: widget.productPrice,
                  cartQuentity: '5',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
