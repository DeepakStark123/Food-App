class ReviewCartModel {
   String cartId;
   String cartImage;
   String cartName;
   String cartPrice;
   String cartQuentity;
   String cartProductUnit;
   bool? isAdd;

   ReviewCartModel({
    required this.cartId,
    required this.cartImage,
    required this.cartName,
    required this.cartPrice,
    required this.cartQuentity,
    required this.cartProductUnit,
    this.isAdd
   });
}