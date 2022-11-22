import 'package:flutter/material.dart';

import 'package:grocery_app/config/colors.dart';
import 'package:grocery_app/models/product_model.dart';
import 'package:grocery_app/screen/widgets/product_unit.dart';

import '../../config/colors.dart';

import '../product_overview/product_overview.dart';
import '../widgets/count.dart';

class SingalProduct extends StatefulWidget {
  final String productImage;

  final String productName;

  final int productPrice;

  final void Function() onTap;
  final String productId;
  final ProductModel productUnit;

  SingalProduct({
    required this.productImage,
    required this.productName,
    required this.onTap,
    required this.productPrice,
    required this.productId,
    required this.productUnit,
  });

  @override
  State<SingalProduct> createState() => _SingalProductState();
}

class _SingalProductState extends State<SingalProduct> {
  var unitData;
  var firstValue;

  @override
  Widget build(BuildContext context) {
    widget.productUnit.productUnit.firstWhere((element) {
      setState(() {
        firstValue = element;
      });
      return true;
    });

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 230,
            width: 165,
            decoration: BoxDecoration(
              color: Color(0xffd9dad9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: widget.onTap,
                  // () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(
                  //     builder: (context) => ProductOverview(
                  //       productImage:
                  //           "https://pngimg.com/uploads/salad/salad_PNG2809.png",
                  //       productName: "Cauliflower Leaves",
                  //     ),
                  //   ),
                  // );
                  // },
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(
                      widget.productImage,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: TextStyle(
                            color: textColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '${widget.productPrice}\$/${unitData == null ? firstValue : unitData}',
                          style: TextStyle(color: Colors.grey),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ProductUnit(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: widget.productUnit.productUnit
                                            .map<Widget>((data) {
                                          return Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 10,
                                                        horizontal: 10),
                                                child: InkWell(
                                                  onTap: () async {
                                                    setState(() {
                                                      unitData = data;
                                                    });

                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text(
                                                    data,
                                                    style: TextStyle(
                                                        color: primaryColor,
                                                        fontSize: 18),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        }).toList(),
                                      );
                                    },
                                  );
                                },
                                title: unitData == null ? firstValue : unitData,
                              ),
//
                            ),

//This Is Second Rectangular Container

                            SizedBox(
                              width: 5,
                            ),

                            Count(
                              productId: widget.productId,
                              productImage: widget.productImage,
                              productName: widget.productName,
                              productPrice: widget.productPrice,
                              productUnit:
                                  unitData == null ? firstValue : unitData,
                              // productQuantity: "1",
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}