import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/modules/home/models/product_model.dart';

class WishListController extends ChangeNotifier{
  final FirebaseFirestore _fireStoreInstance = FirebaseFirestore.instance;
  final List<ProductModel> _wishlist = [];
  List<ProductModel> get wishlist => _wishlist;
  late bool _loading = false;
  get load => _loading;

  //-----------loading status--------
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //------- Add Data to wishList --------
  void addWishListData({
    required String wishListId,
    required String wishListImage,
    required String wishListName,
    required String wishListPrice,
    required String wishListQuentity,
  }) async {
    await _fireStoreInstance
        .collection("WishList")
        .doc("123")
        .collection("YourWishList")
        .doc(wishListId)
        .set({
      "wishListId": wishListId,
      "wishListImage": wishListImage,
      "wishListName": wishListName,
      "wishListPrice": wishListPrice,
      "wishListQuentity": wishListQuentity,
      "wishlist": true,
    });
  }

  //---------Get WishList Data----------
  void getWishListtData() async {
    setLoading(true);
    List<ProductModel> newList = [];
    QuerySnapshot wishListValue = await FirebaseFirestore.instance
        .collection("WishList")
        .doc("123")
        .collection("YourWishList")
        .get();
    for (var element in wishListValue.docs) {
      ProductModel reviewCartModel = ProductModel(
        productId: element.get("wishListId"), 
        productImage: element.get("wishListImage"), 
        productName: element.get("wishListName"),  
        productPrice: element.get("wishListPrice"),
        productQuentity: element.get("wishListQuentity"),
      );
      newList.add(reviewCartModel);
    }
    _wishlist.clear();
    _wishlist.addAll(newList);
    setLoading(false);
    notifyListeners();
  }

  
  //---------WishList Data Delete----------
  deleteWishListData(String cartId) async {
    setLoading(true);
    await _fireStoreInstance
        .collection("WishList")
        .doc("123")
        .collection("YourWishList")
        .doc(cartId)
        .delete();
    getWishListtData();
    notifyListeners();
  }

}