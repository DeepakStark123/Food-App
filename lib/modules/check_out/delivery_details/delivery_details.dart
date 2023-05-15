// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:food_app/modules/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:food_app/modules/check_out/check_out_provider.dart';
import 'package:food_app/modules/check_out/delivery_details/delivery_address_model.dart';
import 'package:food_app/modules/check_out/delivery_details/single_delivery_item.dart';
import 'package:food_app/modules/check_out/payment_summary/payment_summary.dart';
import 'package:food_app/utils/colors.dart';
import 'package:provider/provider.dart';

class DeliveryDetails extends StatefulWidget {
  @override
  _DeliveryDetailsState createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
   DeliveryAddressModel? value;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Delivery Details"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.kappBarColorlight,
        child:const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) =>const AddDeliverAddress(),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        // width: 160,
        height: 48,
        margin:const  EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          onPressed: () {
            deliveryAddressProvider.getDeliveryAddressList.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>const AddDeliverAddress(),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentSummary(
                        deliverAddressList: value!,
                      ),
                    ),
                  );
          },
          color: AppColors.kappBarColorlight,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30,
            ),
          ),
          child:  deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? const Text("Add new Address")
              : const Text("Payment Summary"),
        ),
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text("Deliver To"),
          ),
          const Divider(
            height: 1,
          ),
          deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? const Center(
                  child: Center(
                    child: Text("No Data"),
                  ),
                )
              : Column(
                  children: deliveryAddressProvider.getDeliveryAddressList
                      .map<Widget>((e) {
                    setState(() {
                    value  = e;
                    });
                    return SingleDeliveryItem(
                      address:
                          "aera, ${e.aera}, street, ${e.street}, society ${e.scoirty}, pincode ${e.pinCode}",
                      title: "${e.firstName} ${e.lastName}",
                      number: e.mobileNo,
                      addressType: e.addressType == "AddressTypes.Home"
                          ? "Home"
                          : e.addressType == "AddressTypes.Other"
                              ? "Other"
                              : "Work",
                    );
                  }).toList(),
                )
        ],
      ),
    );
  }
}
