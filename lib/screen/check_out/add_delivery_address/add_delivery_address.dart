import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';
import 'package:grocery_app/providers/check_out_provider.dart';
import 'package:grocery_app/screen/widgets/costom_text_field.dart';
import 'package:provider/provider.dart';

class AddDeliveryAddress extends StatefulWidget {
  @override
  State<AddDeliveryAddress> createState() => _AddDeliveryAddressState();
}

enum AddressTypes {
  Home,
  Work,
  Other,
}

class _AddDeliveryAddressState extends State<AddDeliveryAddress> {
  var myType = AddressTypes.Home;

  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Delivery Address",
          style: TextStyle(fontSize: 18, color: textColor),
        ),
        backgroundColor: primaryColor,
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        width: 160,
        height: 48,
        child: checkoutProvider.isloading == false
            ? MaterialButton(
                onPressed: () {
                  checkoutProvider.validator(context, myType);
                },
                child: Text(
                  "Add Address",
                  style: TextStyle(color: textColor),
                ),
                color: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CostomTextField(
              labText: "First Name",
              controller: checkoutProvider.firstName,
            ),
            CostomTextField(
              labText: "Last Name",
              controller: checkoutProvider.lastName,
            ),
            CostomTextField(
              labText: "Mobile No",
              controller: checkoutProvider.mobileNo,
            ),
            CostomTextField(
              labText: "Alternative Mobile no",
              controller: checkoutProvider.alternateMobileNo,
            ),
            CostomTextField(
              labText: "Society",
              controller: checkoutProvider.society,
            ),
            CostomTextField(
              labText: "Street",
              controller: checkoutProvider.street,
            ),
            CostomTextField(
              labText: "Landmark",
              controller: checkoutProvider.landmark,
            ),
            CostomTextField(
              labText: "City",
              controller: checkoutProvider.city,
            ),
            CostomTextField(
              labText: "Area",
              controller: checkoutProvider.area,
            ),
            CostomTextField(
              labText: "Pincode",
              controller: checkoutProvider.pincode,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [Text("Set Location")],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Address Type*"),
            ),
            RadioListTile(
              value: AddressTypes.Home,
              title: Text("Home"),
              groupValue: myType,
              onChanged: (asd) {},
              secondary: Icon(
                Icons.home,
                color: primaryColor,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Work,
              title: Text("Work"),
              groupValue: myType,
              onChanged: (asd) {},
              secondary: Icon(
                Icons.work,
                color: primaryColor,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Other,
              title: Text("Other"),
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
        ),
      ),
    );
  }
}
