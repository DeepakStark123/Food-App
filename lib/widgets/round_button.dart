import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {super.key,
      this.loading = false,
      required this.title,
      required this.onPressed,
      this.width = 200,
      });
  final String title;
  final bool loading;
  final VoidCallback onPressed;
  final double width;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 40,
        width: width,
        decoration: BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
            child: loading
                ? const CircularProgressIndicator(color: AppColors.kwhiteColor,)
                : Text(
                    title,
                    style: const TextStyle(color: AppColors.kwhiteColor),
                  )),
      ),
    );
  }
}
