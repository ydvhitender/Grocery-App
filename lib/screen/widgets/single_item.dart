import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';
import 'package:grocery_app/screen/widgets/count.dart';

class SingleItem extends StatelessWidget {
  bool isBool = false;

  String productImage;
  String productName;
  int productPrice;
  String productId;
  int productQuantity;
  var productUnit;
  final VoidCallback onDelete;
  bool wishList = false;

  SingleItem(
      {required this.isBool,
      required this.productId,
      required this.productQuantity,
      required this.productImage,
      required this.onDelete,
      required this.productName,
      required this.wishList,
      this.productUnit,
      required this.productPrice});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 100,
                  child: Center(
                    child: Image.network(productImage),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  height: 100,
                  child: Column(
                    mainAxisAlignment: isBool == false
                        ? MainAxisAlignment.spaceAround
                        : MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Text(
                            productName,
                            style: TextStyle(
                                color: textColor, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$productPrice\$/50 Gram",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      isBool == false
                          ? GestureDetector(
                              onTap: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: <Widget>[
                                        ListTile(
                                          title: new Text('50 Gram'),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: new Text('500 Gram'),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                        ListTile(
                                          title: new Text('1 Kg'),
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.only(right: 15),
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                height: 35,
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "50 Gram",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    Center(
                                      child: Icon(
                                        Icons.arrow_drop_down,
                                        size: 20,
                                        color: primaryColor,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Text(productUnit)
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                    height: 100,
                    padding: isBool == false
                        ? EdgeInsets.symmetric(horizontal: 15, vertical: 32)
                        : EdgeInsets.only(left: 15, right: 15),
                    child: isBool == false
                        ? Count(
                            productId: productId,
                            productImage: productImage,
                            productName: productName,
                            productPrice: productPrice,
                            productUnit: productUnit,
                            // productQuantity: "1",
                          )
                        : Column(
                            children: [
                              InkWell(
                                onTap: onDelete,
                                child: Icon(
                                  Icons.delete,
                                  size: 30,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),

                              // Padding(
                              //   padding: const EdgeInsets.only(top: 8),
                              //   child:
                              wishList == true
                                  ? Container(
                                      height: 25,
                                      width: 70,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.remove,
                                              color: primaryColor,
                                              size: 20,
                                            ),
                                            Text(
                                              "1",
                                              style: TextStyle(
                                                color: primaryColor,
                                              ),
                                            ),
                                            Icon(
                                              Icons.add,
                                              color: primaryColor,
                                              size: 20,
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  : Container(),
                              // )
                            ],
                          )),
              ),
            ],
          ),
        ),
        isBool == false
            ? Container()
            : Divider(
                height: 1,
                color: Colors.black45,
              )
      ],
    );
  }
}
