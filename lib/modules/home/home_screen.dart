import 'package:flutter/material.dart';
import 'package:food_app/modules/home/home_controller/product_controller.dart';
import 'package:food_app/modules/home/homescreen_drawer.dart';
import 'package:food_app/modules/home/product_overView.dart';
import 'package:food_app/modules/products/review_cart/review_cart.dart';
import 'package:food_app/modules/products/search/search.dart';
import 'package:food_app/modules/theme/theme_provider.dart';
import 'package:food_app/utils/colors.dart';
import 'package:food_app/widgets/item_card.dart';
import 'package:food_app/widgets/loading_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ProductController? productController;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ProductController initproductProvider =
          Provider.of<ProductController>(context, listen: false);
      initproductProvider.getInitData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themePreferenceMode =
        Provider.of<ThemeController>(context, listen: false);
    productController = Provider.of(context);
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: const HomeScreenDrawer(),
      appBar: AppBar(
        title: const Text("Home"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Search(
                            searchList: productController!.searchProductList,
                          )),
                );
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.search,
                  color: AppColors.kblackColor,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const ReviwCart()));
              },
              child: const CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.wallet,
                  color: AppColors.kblackColor,
                ),
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                themePreferenceMode.isDarkMode =
                    !themePreferenceMode.isDarkMode;
              },
              icon: Provider.of<ThemeController>(context).isDarkMode
                  ? const Icon(Icons.sunny)
                  : const Icon(Icons.nightlight)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: h / 70),
                height: h / 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/images/banner1.jpg'),
                    )),
              ),
              Column(
                children: [
                  TitleBar(
                      viewAllOnTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Search(
                                      searchList:
                                          productController!.herbsProductList,
                                    )));
                      },
                      title: "Herbs Seasonings"),
                  SizedBox(
                    height: h / 2.5,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productController!.load
                          ? 8
                          : productController!.herbsProductList.length,
                      itemBuilder: (context, idx) {
                        if (productController!.load) {
                          return LoadingWidgeItem(
                            height: h / 2.5,
                          );
                        } else {
                          return Padding(
                            padding: EdgeInsets.only(right: w / 70),
                            child: ItemCard(
                                imageTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductOverView(
                                          imageUrl: productController!
                                              .herbsProductList[idx]
                                              .productImage
                                              .toString(),
                                          productName: productController!
                                              .herbsProductList[idx].productName
                                              .toString(),
                                          price: productController!
                                              .herbsProductList[idx]
                                              .productPrice
                                              .toString(),
                                          productId: productController!
                                              .herbsProductList[idx].productId
                                              .toString(),
                                          productUnitList: productController!
                                              .herbsProductList[idx]
                                              .productUnit),
                                    ),
                                  );
                                },
                                imageUrl: productController!
                                    .herbsProductList[idx].productImage
                                    .toString(),
                                vegiName: productController!
                                    .herbsProductList[idx].productName
                                    .toString(),
                                price: productController!
                                    .herbsProductList[idx].productPrice
                                    .toString(),
                                productId: productController!
                                    .herbsProductList[idx].productId
                                    .toString(),
                                productUnitList: productController!
                                    .herbsProductList[idx].productUnit),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  TitleBar(
                      viewAllOnTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Search(
                                      searchList:
                                          productController!.fruitsdProductList,
                                    )));
                      },
                      title: "Fresh Fruits"),
                  SizedBox(
                    height: h / 2.5,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productController!.load
                            ? 8
                            : productController!.fruitsdProductList.length,
                        itemBuilder: (context, idx) {
                          if (productController!.load) {
                            return LoadingWidgeItem(
                              height: h / 2.5,
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsets.only(right: w / 70),
                              child: ItemCard(
                                  imageTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductOverView(
                                            imageUrl: productController!
                                                .fruitsdProductList[idx]
                                                .productImage
                                                .toString(),
                                            productName: productController!
                                                .fruitsdProductList[idx]
                                                .productName
                                                .toString(),
                                            price: productController!
                                                .fruitsdProductList[idx]
                                                .productPrice
                                                .toString(),
                                            productId: productController!
                                                .fruitsdProductList[idx]
                                                .productId
                                                .toString(),
                                            productUnitList: productController!
                                                .fruitsdProductList[idx]
                                                .productUnit),
                                      ),
                                    );
                                  },
                                  imageUrl: productController!
                                      .fruitsdProductList[idx].productImage
                                      .toString(),
                                  vegiName: productController!
                                      .fruitsdProductList[idx].productName
                                      .toString(),
                                  price: productController!
                                      .fruitsdProductList[idx].productPrice
                                      .toString(),
                                  productId: productController!
                                      .fruitsdProductList[idx].productId
                                      .toString(),
                                  productUnitList: productController!
                                      .fruitsdProductList[idx].productUnit),
                            );
                          }
                        }),
                  ),
                ],
              ),
              Column(
                children: [
                  TitleBar(
                      viewAllOnTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Search(
                                      searchList: productController!
                                          .vigitablesProductList,
                                    )));
                      },
                      title: "Fresh Vegitables"),
                  SizedBox(
                    height: h / 2.5,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: productController!.load
                            ? 8
                            : productController!.vigitablesProductList.length,
                        itemBuilder: (context, idx) {
                          if (productController!.load) {
                            return LoadingWidgeItem(
                              height: h / 2.5,
                            );
                          } else {
                            return Padding(
                              padding: EdgeInsets.only(right: w / 70),
                              child: ItemCard(
                                  imageTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ProductOverView(
                                            imageUrl: productController!
                                                .vigitablesProductList[idx]
                                                .productImage
                                                .toString(),
                                            productName: productController!
                                                .vigitablesProductList[idx]
                                                .productName
                                                .toString(),
                                            price: productController!
                                                .vigitablesProductList[idx]
                                                .productPrice
                                                .toString(),
                                            productId: productController!
                                                .vigitablesProductList[idx]
                                                .productId
                                                .toString(),
                                            productUnitList: productController!
                                                .vigitablesProductList[idx]
                                                .productUnit),
                                      ),
                                    );
                                  },
                                  imageUrl: productController!
                                      .vigitablesProductList[idx].productImage
                                      .toString(),
                                  vegiName: productController!
                                      .vigitablesProductList[idx].productName
                                      .toString(),
                                  price: productController!
                                      .vigitablesProductList[idx].productPrice
                                      .toString(),
                                  productId: productController!
                                      .vigitablesProductList[idx].productId
                                      .toString(),
                                  productUnitList: productController!
                                      .vigitablesProductList[idx].productUnit),
                            );
                          }
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TitleBar extends StatelessWidget {
  const TitleBar({
    super.key,
    required this.title,
    this.viewAllOnTap,
  });

  final String title;
  final void Function()? viewAllOnTap;

  @override
  Widget build(BuildContext context) {
    final themePreferenceMode =
        Provider.of<ThemeController>(context, listen: false);
    double h = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h / 50),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          GestureDetector(
            onTap: viewAllOnTap,
            child: Text(
              "view all",
              style: TextStyle(
                  color: themePreferenceMode.isDarkMode
                      ? Colors.white
                      : Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
