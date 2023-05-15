
import 'package:flutter/material.dart';
import 'package:food_app/modules/products/wishlist/wishlist_controller.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/single_review_cart.dart';
import 'package:provider/provider.dart';

class WishList extends StatefulWidget {
  const WishList({super.key});

  @override
  State<WishList> createState() => _WishListState();
}

class _WishListState extends State<WishList> {
  WishListController? wishListController;


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      WishListController initproductProvider =
          Provider.of<WishListController>(context, listen: false);
      initproductProvider.getWishListtData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final wishListController = Provider.of<WishListController>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Review Cart"),
        ),
        bottomNavigationBar: ListTile(
          title: const Text("Total Amount"),
          subtitle: const Text("\$150.00"),
          trailing: SizedBox(
            width: 200,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kappBarColorlight,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {},
              child: const Text("Submit"),
            ),
          ),
        ),
        body: wishListController.load
            ? const Center(child: CircularProgressIndicator(color: Colors.blue,))
            : SingleChildScrollView(
              child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: wishListController.wishlist.isEmpty
                            ? 0
                            : wishListController.wishlist.length,
                        itemBuilder: (context, idx) {
                          var data = wishListController.wishlist[idx];
                          return SingleReviewItem(
                            imageUrl: data.productImage,
                            vegiName: data.productName,
                            price: data.productPrice,
                            productId: data.productId,
                            productUnit: "hf",
                            isWishList: true,
                            onDelete: (){
                               wishListController.deleteWishListData(data.productId);
                            },
                          );
                        }),
                  ],
                ),
            ),
      );
  }

}