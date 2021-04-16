import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:payment/commons.dart';
import 'package:payment/widgets/title.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Paymenthelper with ChangeNotifier {
  handlePaymentSuccess(
      BuildContext context, PaymentSuccessResponse paymentSuccessResponse) {
    return showResponse(context, paymentSuccessResponse.paymentId);
  }

  handlePaymentError(
      BuildContext context, PaymentFailureResponse paymentFailureResponse) {
    return showResponse(context, paymentFailureResponse.message);
  }

  handleExternalWallet(
      BuildContext context, ExternalWalletResponse externalWalletResponse) {
    return showResponse(context, externalWalletResponse.walletName);
  }

  showResponse(BuildContext context, String response) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 100.0,
            width: 400,
            child: CustomText(
              text: 'The response is $response',
              color: white,
            ),
          );
        });
  }
}
