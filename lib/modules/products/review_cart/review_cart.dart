import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_app/modules/check_out/delivery_details/delivery_details.dart';
import 'package:food_app/modules/products/review_cart/review_cart_controller.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/single_review_cart.dart';
import 'package:provider/provider.dart';

class ReviwCart extends StatefulWidget {
 const ReviwCart(
      {super.key,});

  @override
  State<ReviwCart> createState() => _ReviwCartState();
}

class _ReviwCartState extends State<ReviwCart>
    with SingleTickerProviderStateMixin {
  ReviewCartController? reviewCartController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ReviewCartController initproductProvider =
          Provider.of<ReviewCartController>(context, listen: false);
      initproductProvider.getReviewCartData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final reviewCartController = Provider.of<ReviewCartController>(context);
    return Scaffold(
        appBar: AppBar(
          title: const Text("Review Cart"),
        ),
        bottomNavigationBar: ListTile(
          title: const Text("Total Amount"),
          subtitle: Consumer<ReviewCartController>(
            builder: (context,value,child) {
              debugPrint("totalPrice = ${value.totalPrice}");
              return Text(value.totalPrice.toString());
            }
          ),
          trailing: SizedBox(
            width: 200,
            height: 40,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.kappBarColorlight,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30))),
              onPressed: () {
                if(reviewCartController.reviewCartDataList.isEmpty){
                  Fluttertoast.showToast(msg: "No Cart Item Found");
                }else{
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> DeliveryDetails()));
                }
              },
              child: const Text("Submit"),
            ),
          ),
        ),
        body: 
        // reviewCartController.load
        //     ? const Center(child: CircularProgressIndicator(color: Colors.blue,))
        //     : 
            SingleChildScrollView(
              child: Column(
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: reviewCartController.reviewCartDataList.isEmpty
                            ? 0
                            : reviewCartController.reviewCartDataList.length,
                        itemBuilder: (context, idx) {
                          var data = reviewCartController.reviewCartDataList[idx];
                          debugPrint("product unit = ${data.cartProductUnit}");
                          return SingleReviewItem(
                            imageUrl: data.cartImage,
                            vegiName: data.cartName,
                            price: data.cartPrice,
                            productId: data.cartId,
                            productUnit: data.cartProductUnit,
                            isWishList: false,
                            onDelete: (){
                               reviewCartController.deleteReviewCartData(data.cartId);
                            },
                          );
                        }),
                  ],
                ),
            ));
  }
}
