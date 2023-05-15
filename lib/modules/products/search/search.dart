import 'package:flutter/material.dart';
import 'package:food_app/modules/home/home_controller/product_controller.dart';
import 'package:food_app/modules/home/models/product_model.dart';
import 'package:food_app/widgets/single_search_item.dart';
import 'package:food_app/modules/theme/theme_provider.dart';
import 'package:food_app/utils/colors.dart';
import 'package:provider/provider.dart';

class Search extends StatefulWidget {
  const Search({super.key, this.searchList});
  final List<ProductModel>? searchList;

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  String query = '';
  ProductController? productController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ProductController initproductProvider =
          Provider.of<ProductController>(context, listen: false);
      initproductProvider.getInitProductList(widget.searchList!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("build");
    // productController = Provider.of(context);
    final themePreferenceMode =
        Provider.of<ThemeController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Serach"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  "Items",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                child: TextFormField(
                  onChanged: (value) {
                    Provider.of<ProductController>(context,listen: false)
                        .searchItem(value.isEmpty ? '' : value.toString());
                  },
                  decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      suffixIcon: const Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: Icon(Icons.search),
                      ),
                      hintText: "Serach for items in the store",
                      fillColor: themePreferenceMode.isDarkMode
                          ? AppColors.kPrimarydark
                          : const Color(0xffc2c2c2),
                      filled: true),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Consumer<ProductController>(builder: (context, value, child) {
                return ListView.builder(
                    itemCount: value.searchList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = value.searchList[index];
                      return SingleSearchItem(
                        producImage: data.productImage,
                        productName: data.productName,
                        productPrice: data.productPrice.toString(),
                        productId: data.productId,
                        productUnitList: data.productUnit
                      );
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
