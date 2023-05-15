// ignore_for_file: sort_child_properties_last, use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:food_app/modules/check_out/delivery_details/delivery_address_model.dart';
import 'package:food_app/modules/check_out/delivery_details/single_delivery_item.dart';
import 'package:food_app/modules/products/review_cart/review_cart_controller.dart';
import 'package:food_app/utils/colors.dart';
import 'package:provider/provider.dart';

class PaymentSummary extends StatefulWidget {
  final DeliveryAddressModel deliverAddressList;
  const PaymentSummary({required this.deliverAddressList});

  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

enum AddressTypes {
  Home,
  OnlinePayment,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressTypes.Home;

  @override
  Widget build(BuildContext context) {
    ReviewCartController reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();

    double discount = 30;
    double discountValue =0;
    double shippingChanrge = 3.7;
    double total = 0;
    double totalPrice = reviewCartProvider.getTotalPrice();
    if (totalPrice > 300) {
      discountValue = (totalPrice * discount) / 100;
      total = totalPrice - discountValue;
    }

    return Scaffold(
      appBar: AppBar(
        title:const Text(
          "Payment Summary",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: ListTile(
        title:const Text("Total Amount"),
        subtitle: Text(
          "\$${total + 5}",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: SizedBox(
          width: 160,
          child: MaterialButton(
            onPressed: () {
              // myType == AddressTypes.OnlinePayment
              //     ? Navigator.of(context).push(
              //         MaterialPageRoute(
              //           builder: (context) => MyGooglePay(
              //             total: total,
              //           ),
              //         ),
              //       )
              //     : Container();
            
            },
            child: const Text(
              "Pleace Order",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            color: AppColors.kappBarColorlight,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SingleDeliveryItem(
                  address:
                      "aera, ${widget.deliverAddressList.aera}, street, ${widget.deliverAddressList.street}, society ${widget.deliverAddressList.scoirty}, pincode ${widget.deliverAddressList.pinCode}",
                  title:
                      "${widget.deliverAddressList.firstName} ${widget.deliverAddressList.lastName}",
                  number: widget.deliverAddressList.mobileNo,
                  addressType: widget.deliverAddressList.addressType ==
                          "AddressTypes.Home"
                      ? "Home"
                      : widget.deliverAddressList.addressType ==
                              "AddressTypes.Other"
                          ? "Other"
                          : "Work",
                ),
                const Divider(),
                ExpansionTile(
                  // children: reviewCartProvider.revi.map((e) {
                  //   return OrderItem(
                  //     e: e,
                  //   );
                  // }).toList(),
                  title: Text(
                      "Order Items ${reviewCartProvider.reviewCartDataList.length}"),
                ),
                const Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: const Text(
                    "Sub Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    "\$${totalPrice + 5}",
                    style:const  TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Shipping Charge",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    "\$$discountValue",
                    style:const  TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Compen Discount",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: const Text(
                    "\$10",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Divider(),
                const ListTile(
                  leading: Text("Payment Options"),
                ),
                RadioListTile(
                  value: AddressTypes.Home,
                  groupValue: myType,
                  title:const Text("Home"),
                  onChanged: (value) {
                    // setState(() {
                    //   myType = value;
                    // });
                  },
                  secondary:const Icon(
                    Icons.work,
                    color: AppColors.kappBarColorlight,
                  ),
                ),
                RadioListTile(
                  value: AddressTypes.OnlinePayment,
                  groupValue: myType,
                  title: const Text("OnlinePayment"),
                  onChanged: ( value) {
                    // setState(() {
                    //   myType = value;
                    // });
                  },
                  secondary: const Icon(
                    Icons.devices_other,
                    color: AppColors.kappBarColorlight,
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
