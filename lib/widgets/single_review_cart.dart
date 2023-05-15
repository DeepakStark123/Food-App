import 'package:flutter/material.dart';
import 'package:food_app/modules/theme/theme_provider.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/count.dart';
import 'package:provider/provider.dart';

class SingleReviewItem extends StatefulWidget {
  const SingleReviewItem({
    super.key,
    required this.imageUrl,
    required this.vegiName,
    required this.price,
    required this.productId,
    required this.productUnit,
    required this.isWishList,
    this.onDelete,
  });

  final String imageUrl;
  final String vegiName;
  final String price;
  final String productId;
  final String productUnit;
  final Function()? onDelete;
  final bool isWishList;

  @override
  State<SingleReviewItem> createState() => _SingleReviewItemState();
}

class _SingleReviewItemState extends State<SingleReviewItem> {

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
                    image: NetworkImage(widget.imageUrl),
                  )),
            ),
          ),
          Expanded(
            child: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    widget.vegiName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("${widget.price}\$"),
                  Text(widget.productUnit.toString()),
                ],
              ),
            ),
          ),
          Expanded(
              child: SizedBox(
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed:widget.onDelete,
                  icon: const Icon(Icons.delete),
                ),
               if(widget.isWishList == false)...[
                Count(
                  cartId: widget.productId,
                  cartImage: widget.imageUrl,
                  cartName: widget.vegiName,
                  cartPrice: widget.price,
                  cartQuentity: '5',
                ),
             
               ] 
              ],
            ),
          )),
        ],
      ),
    );
  }
}
