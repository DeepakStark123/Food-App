import 'package:flutter/material.dart';
import 'package:food_app/modules/theme/theme_provider.dart';
import 'package:food_app/utils/colors.dart';
import 'package:provider/provider.dart';

class LoadingWidgeItem extends StatelessWidget {
  const LoadingWidgeItem(
      {super.key,
       this.height = 400,
       this.width = 200,
      });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    final themePreferenceMode =
        Provider.of<ThemeController>(context, listen: false);
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h / 2.5,
      width: 200,
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      margin: const EdgeInsets.symmetric( horizontal: 5),
      decoration: BoxDecoration(
          color: themePreferenceMode.isDarkMode
              ? AppColors.kPrimarydark
              : AppColors.kwhiteColor,
          borderRadius: BorderRadius.circular(10)),
      child:  const Center(child: CircularProgressIndicator(color: Colors.blue,))
    );
  }
}
