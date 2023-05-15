import 'package:flutter/material.dart';
import 'package:food_app/modules/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class ProductUnit extends StatelessWidget {
  const ProductUnit({super.key, this.onTap, required this.title});
  final String title;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final themePreferenceMode =
        Provider.of<ThemeController>(context, listen: false);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.fromLTRB(2,5,2,5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
                color: themePreferenceMode.isDarkMode
                    ? Colors.white54
                    : Colors.black54)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,
                style: TextStyle(
                    color: themePreferenceMode.isDarkMode
                        ? Colors.white54
                        : Colors.black54,fontSize: 12)),
            const Icon(
              Icons.arrow_drop_down,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
