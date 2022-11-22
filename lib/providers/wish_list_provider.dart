import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:grocery_app/models/product_model.dart';

class WishListProvider with ChangeNotifier {
  void addWishListData({
    required String wishListId,
    required String wishListName,
    required String wishListImage,
    required int wishListPrice,
    required List<dynamic> wishListUnit,
    required int wishListQuantity,
  }) async {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .doc(wishListId)
        .set(
      {
        "wishListId": wishListId,
        "wishListName": wishListName,
        "wishListImage": wishListImage,
        "wishListPrice": wishListPrice,
        "wishListUnit": wishListUnit,

        //"wishListQuantity": wishListQuantity,
        "wishList": true,
      },
    );
  }

  List<ProductModel> wishList = [];

  ////////////get wishlist////////////

  getWishListData() async {
    List<ProductModel> newList = [];
    QuerySnapshot value = await FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .get();
    value.docs.forEach(
      (element) {
        ProductModel productModel = ProductModel(
          productId: element.get("wishListId"),
          productImage: element.get("wishListImage"),
          productName: element.get("wishListName"),
          productPrice: element.get("wishListPrice"),

          productUnit: element.get("wishListUnit"),

          //productQuantity: element.get("wishListQuantity")
        );
        newList.add(productModel);
      },
    );

    wishList = newList;
    notifyListeners();
  }

  List<ProductModel> get getWishList {
    return wishList;
  }

  //////////////////Delete///////////
  deleteWishList(wishlistId) {
    FirebaseFirestore.instance
        .collection("WishList")
        .doc(FirebaseAuth.instance.currentUser?.uid)
        .collection("YourWishList")
        .doc(wishlistId)
        .delete();
  }
}
