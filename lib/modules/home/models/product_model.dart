class ProductModel {
   String productName;
   String productImage;
   String productPrice;
   String productId;
   String? productQuentity;
   List<dynamic>? productUnit;

  ProductModel({
    required this.productName, 
    required this.productImage, 
    required this.productPrice,
    required this.productId,
    this.productQuentity,
    this.productUnit,
  });
}