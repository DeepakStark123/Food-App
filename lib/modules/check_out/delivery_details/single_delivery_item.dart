import 'package:flutter/material.dart';
import 'package:food_app/utils/colors.dart';

class SingleDeliveryItem extends StatelessWidget {
  final String title;
  final String address;
  final String number;
  final String addressType;
   // ignore: use_key_in_widget_constructors
   const SingleDeliveryItem(
      {required this.title,
      required this.addressType,
      required this.address,
      required this.number});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Container(
                width: 60,
                padding: const EdgeInsets.all(1),
                height: 20,
                decoration: BoxDecoration(
                    color: AppColors.kappBarColorlight,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    addressType,
                    style: const TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
          leading: const CircleAvatar(
            radius: 8,
            backgroundColor: AppColors.kappBarColorlight,
          ),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(address),
              const SizedBox(
                height: 5,
              ),
              Text(number),
            ],
          ),
        ),
        const Divider(
          height: 35,
        ),
      ],
    );
  }
}
