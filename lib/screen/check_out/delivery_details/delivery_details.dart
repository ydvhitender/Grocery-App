import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';
import 'package:grocery_app/models/delivery_address_model.dart';
import 'package:grocery_app/providers/check_out_provider.dart';
import 'package:grocery_app/screen/check_out/add_delivery_address/add_delivery_address.dart';
import 'package:grocery_app/screen/check_out/delivery_details/single_delivery_item.dart';
import 'package:grocery_app/screen/check_out/payment_summary/payment_summary.dart';
import 'package:provider/provider.dart';

class DeliveryDetails extends StatefulWidget {
  @override
  State<DeliveryDetails> createState() => _DeliveryDetailsState();
}

class _DeliveryDetailsState extends State<DeliveryDetails> {
  late DeliveryAddressModel value;
  //bool isAddress = false;
  @override
  Widget build(BuildContext context) {
    //print(value.landMark);
    CheckoutProvider deliveryAddressProvider = Provider.of(context);
    deliveryAddressProvider.getDeliveryAddressData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Delivery Details"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => AddDeliveryAddress(),
            ),
          );
        },
      ),
      bottomNavigationBar: Container(
        //width: 160,
        height: 48,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: MaterialButton(
          child: deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Text("Add new Address")
              : Text("Payment Summary"),
          onPressed: () {
            deliveryAddressProvider.getDeliveryAddressList.isEmpty
                ? Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => AddDeliveryAddress(),
                    ),
                  )
                : Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => PaymentSummary(
                        deliveryAddressList: value,
                      ),
                    ),
                  );
          },
          color: primaryColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text("Deliver To"),
            leading: Image.network(
              "https://i.pinimg.com/originals/9b/56/f5/9b56f50e5f4a28da700b0c991d96b5c7.png",
              height: 30,
            ),
          ),
          Divider(
            height: 1,
          ),
          deliveryAddressProvider.getDeliveryAddressList.isEmpty
              ? Container(
                  child: Center(
                    child: Text("NO DATA"),
                  ),
                )
              : Column(
                  children: deliveryAddressProvider.getDeliveryAddressList
                      .map<Widget>((e) {
                    setState(() {
                      value = e;
                    });

                    return SingleDeliveryItem(
                      address:
                          "Area ${e.area}, Street ${e.street}, Socity ${e.society},Landmark ${e.landMark}, Pincode ${e.pinCode}",
                      title: "${e.firstname}${e.lastname}",
                      addressType: e.addressType == "AddressTypes.Home"
                          ? "Home"
                          : e.addressType == "AddressTypes.Other"
                              ? "Other"
                              : "Work",
                      number: e.mobileNo,
                    );
                  }).toList(),
                  // children: [
                  // deliveryAddressProvider.getDeliveryAddressList.isEmpty
                  //     ? Container(
                  //         child: Center(
                  //           child: Text("NO DATA"),
                  //         ),
                  //       )
                  // : SingleDeliveryItem(
                  //     address:
                  //         "area, city, state/country, 20, socity 07 , pincode 678967",
                  //     title: "Android Dev",
                  //     addressType: "Home",
                  //     number: "+8989898970",
                  //   ),
                  // ],
                )
        ],
      ),
    );
  }
}
