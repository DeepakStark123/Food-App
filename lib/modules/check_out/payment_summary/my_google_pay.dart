// ignore_for_file: use_key_in_widget_constructors, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

class MyGooglePay extends StatefulWidget {
  final total;
  const MyGooglePay({this.total});
  @override
  _MyGooglePayState createState() => _MyGooglePayState();
}

class _MyGooglePayState extends State<MyGooglePay> {
// In your Widget build() method

// In your Stateless Widget class or State
  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult);
    // Send the resulting Google Pay token to your server or PSP
  }

  @override
  Widget build(BuildContext context) {
    return GooglePayButton(
      paymentConfigurationAsset: 'sample_payment_configuration.json',
      paymentItems: [
        PaymentItem(
          label: 'Total',
          amount: '${widget.total}',
          status: PaymentItemStatus.final_price,
        )
      ],
      // style: GooglePayButtonStyle.black,
      type: GooglePayButtonType.pay,
      onPaymentResult: onGooglePayResult,
    );
  }
}
