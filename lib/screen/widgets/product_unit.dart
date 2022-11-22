import 'package:flutter/material.dart';

class ProductUnit extends StatelessWidget {
  final Function() onTap;
  final String title;
  ProductUnit({required this.onTap,required this.title});
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
                                onTap: onTap,
                                child: Container(
                                  padding: EdgeInsets.only(left: 5),
                                  height: 25,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Row(
                                    children: [
// Quantity

                                      Expanded(
                                          child: Text(
                                        '$title',
                                        style: TextStyle(fontSize: 10),
                                      )),

// Arrow

                                      Center(
                                        child: Icon(
                                          Icons.arrow_drop_down,
                                          size: 19,
                                          color: Colors.brown,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
  }

}