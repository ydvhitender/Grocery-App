//import 'dart:html';

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';
import 'package:grocery_app/models/delivery_address_model.dart';
import 'package:grocery_app/providers/check_out_provider.dart';
import 'package:grocery_app/providers/product_provider.dart';
import 'package:grocery_app/providers/review_cart_provider.dart';
import 'package:grocery_app/screen/check_out/payment_summary/order_item.dart';
import 'package:provider/provider.dart';

import '../delivery_details/single_delivery_item.dart';

enum AddressTypes {
  Home,
  OnlinePayment,
}

class PaymentSummary extends StatefulWidget {
  final DeliveryAddressModel deliveryAddressList;

  PaymentSummary({required this.deliveryAddressList});
  //var myType= AddressTypes.OnlinePayment;

  @override
  State<PaymentSummary> createState() => _PaymentSummaryState();
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressTypes.OnlinePayment;

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    reviewCartProvider.getReviewCartData();

    double discount = 30;
    late double discountValue;
    late double total;

    double shippingCharge = 3.7;

    double totalPrice = reviewCartProvider.getTotalPrice();

    if (totalPrice > 300) {
      discountValue = (totalPrice * discount) / 100;
      total = totalPrice - discountValue;
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Payment Summary",
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      ),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "\$${total + 5}",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {},
            child: Text(
              "Pleace Order",
              style: TextStyle(
                color: textColor,
              ),
            ),
            color: primaryColor,
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
                      "Area ${widget.deliveryAddressList.area}, Street ${widget.deliveryAddressList.street}, Socity ${widget.deliveryAddressList.society},Landmark ${widget.deliveryAddressList.landMark}, Pincode ${widget.deliveryAddressList.pinCode}",
                  title:
                      "${widget.deliveryAddressList.firstname}${widget.deliveryAddressList.lastname}",
                  addressType: widget.deliveryAddressList.addressType ==
                          "AddressTypes.Home"
                      ? "Home"
                      : widget.deliveryAddressList.addressType ==
                              "AddressTypes.Other"
                          ? "Other"
                          : "Work",
                  number: widget.deliveryAddressList.mobileNo,
                ),
                Divider(),
                ExpansionTile(
                  children: reviewCartProvider.getReviewCartDataList.map(
                    (e) {
                      return OrderItem(
                        e: e,
                      );
                    },
                  ).toList(),
                  title: Text(
                      "Order Item ${reviewCartProvider.getReviewCartDataList.length}"),
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Sub Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    "\$${totalPrice + 5}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Shipping Charge",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Text(
                    "\$5",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Coupen Discount",
                    style: TextStyle(
                      color: Colors.grey[600],
                    ),
                  ),
                  trailing: Text(
                    "\$$discountValue",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text("Payment Options"),
                ),
                RadioListTile(
                  value: AddressTypes.Home,
                  title: Text("Pay On Delivery"),
                  groupValue: myType,
                  onChanged: (asd) {},
                  secondary: Icon(
                    Icons.work,
                    color: primaryColor,
                  ),
                ),
                RadioListTile(
                  value: AddressTypes.OnlinePayment,
                  title: Text("Online Payment"),
                  groupValue: myType,
                  onChanged: (asd) {},
                  // (AddressTypes value) {
                  //   setState(() {
                  //     myType = value;
                  //   });
                  // },
                  secondary: Icon(
                    Icons.devices_other,
                    color: primaryColor,
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
