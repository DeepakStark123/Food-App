// ignore_for_file: use_build_context_synchronously, avoid_print
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_app/modules/home/models/product_model.dart';

class ProductController extends ChangeNotifier {
  late bool _loading = false;
  ProductModel? productModel;
  final List<ProductModel> _herbsProductList = [];
  final List<ProductModel> _fruitsdProductList = [];
  final List<ProductModel> _vigitablesProductList = [];
  final List<ProductModel> _searchProductList = [];
  final List<ProductModel> _searchList = [];
  final List<ProductModel> prodctHolderList = [];
  List<ProductModel> get herbsProductList => _herbsProductList;
  List<ProductModel> get fruitsdProductList => _fruitsdProductList;
  List<ProductModel> get vigitablesProductList => _vigitablesProductList;
  List<ProductModel> get searchProductList => _searchProductList;
  List<ProductModel> get searchList => _searchList;
  get load => _loading;

  //-----------loading status--------
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }
  //----getting---fresh---herbs-------
  fetchHerbsProductData() async {
    setLoading(true);
    _herbsProductList.addAll(await getProducts("HerbsProduct"));
    setLoading(false);
    notifyListeners();
  }
  //----getting---fresh---Fruits-------
  fetchFruitsProductData() async {
    setLoading(true);
    _fruitsdProductList.addAll(await getProducts("FreshFruits"));
    setLoading(false);
    notifyListeners();
  }

  //----getting---fresh---Fruits-------
  fetchVegitableProductData() async {
    setLoading(true);
    _vigitablesProductList.addAll(await getProducts("FreshVegitable"));
    setLoading(false);
    notifyListeners();
  }
  //------------Get Products from querysnapshot------------
  getProducts(String collectionPath) async {
      QuerySnapshot value =
        await FirebaseFirestore.instance.collection(collectionPath).get();
      List<ProductModel> tempList = [];
      for (var element in value.docs) {
        productModel = ProductModel(
            productName: element.data().toString().contains('ProductName')
                ? element.get('ProductName').toString()
                : '',
            productImage: element.data().toString().contains('ProductImage')
                  ? element.get('ProductImage').toString()
                  : '',
            productPrice: element.data().toString().contains('ProductPrice')
                  ? element.get('ProductPrice').toString()
                  : '',
            productId: element.data().toString().contains('ProductId')
                  ? element.get('ProductId').toString()
                  : '',
            productUnit : element.data().toString().contains('ProductUnit')
                  ? element.get('ProductUnit')
                  : '',
        );
        tempList.add(productModel!);
        _searchProductList.add(productModel!);
      }
      return tempList;
  }

  //------------initializw the functions------------
  getInitData() async{
    await fetchHerbsProductData();
    await fetchFruitsProductData();
    await fetchVegitableProductData();
    notifyListeners();
  }
  
  //------------Searching Function------------
  getInitProductList(var searchListData) {
    searchList.clear();
    prodctHolderList.clear();
    searchList.addAll(searchListData);
    prodctHolderList.addAll(searchListData);
    notifyListeners();
    return searchList;
  }
  //------------Searching Function------------
  searchItem(String query) {
    searchList.clear();
    if(query == ''){
      searchList.addAll(prodctHolderList);
    }else{
      List<ProductModel> tempSearchList = [];
      tempSearchList = prodctHolderList.where((element) {
        return element.productName.toLowerCase().contains(query.toLowerCase());
      }).toList();
      searchList.addAll(tempSearchList);
    }
    notifyListeners();
  }

}
