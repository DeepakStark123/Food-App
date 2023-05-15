import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/modules/products/review_cart/review_cart_model.dart';

class ReviewCartController extends ChangeNotifier {
  late bool _loading = false;
  double _totalPrice = 0.0;
  final FirebaseFirestore _fireStoreInstance = FirebaseFirestore.instance;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  ReviewCartModel? reviewCartModel;
  final List<ReviewCartModel> _reviewCartDataList = [];
  List<ReviewCartModel> get reviewCartDataList => _reviewCartDataList;
  get load => _loading;
  get totalPrice => _totalPrice;

  void addReviewCartData({
    required String cartId,
    required String cartImage,
    required String cartName,
    required String cartPrice,
    required String cartQuentity,
    required String cartProductUnit
  }) async {
    await _fireStoreInstance
        .collection("ReviewCart")
        .doc("123")
        .collection("YourReviewCart")
        .doc(cartId)
        .set({
      "cartId": cartId,
      "cartImage": cartImage,
      "cartName": cartName,
      "cartPrice": cartPrice,
      "cartQuentity": cartQuentity,
      "cartProductUnit":cartProductUnit,
      "isAdd": true,
    });
  }

  //-----------loading status--------
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  //---------Get ReviewCart Data----------
  void getReviewCartData() async {
    setLoading(true);
    List<ReviewCartModel> newList = [];
    QuerySnapshot reviewCartValue = await FirebaseFirestore.instance
        .collection("ReviewCart")
        .doc("123")
        .collection("YourReviewCart")
        .get();
    for (var element in reviewCartValue.docs) {
      ReviewCartModel reviewCartModel = ReviewCartModel(
        cartId: element.get("cartId"),
        cartImage: element.get("cartImage"),
        cartName: element.get("cartName"),
        cartPrice: element.get("cartPrice"),
        cartQuentity: element.get("cartQuentity"),
        cartProductUnit: element.get("cartProductUnit"),
      );
      newList.add(reviewCartModel);
    }
    _reviewCartDataList.clear();
    _reviewCartDataList.addAll(newList);
    debugPrint(_reviewCartDataList.toString());
    setLoading(false);
    getTotalPrice();
    notifyListeners();
  }

  //---------ReviewCart Data Delete----------
  deleteReviewCartData(String cartId) async {
    setLoading(true);
    await _fireStoreInstance
        .collection("ReviewCart")
        .doc("123")
        .collection("YourReviewCart")
        .doc(cartId)
        .delete();
    getReviewCartData();
    notifyListeners();
  }

  //---------ReviewCart Data Delete----------
  void updateReviewCartData({
    required String cartId,
    required String cartImage,
    required String cartName,
    required String cartPrice,
    required String cartQuentity,
    required String cartProductUnit
  }) async {
    await _fireStoreInstance
        .collection("ReviewCart")
        .doc("123")
        .collection("YourReviewCart")
        .doc(cartId)
        .set({
      "cartId": cartId,
      "cartImage": cartImage,
      "cartName": cartName,
      "cartPrice": cartPrice,
      "cartQuentity": cartQuentity,
      "cartProductUnit":cartProductUnit,
      "isAdd": true,
    }).then((value) => getReviewCartData());
    notifyListeners();
  }
  
  //---------Total Price----------
  getTotalPrice(){
    _totalPrice = 0.0;
    for (var element in _reviewCartDataList) {
      _totalPrice += double.parse(element.cartPrice) * double.parse(element.cartQuentity);
    }
    notifyListeners();
  }
}
