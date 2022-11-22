//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:grocery_app/config/colors.dart';

import 'package:grocery_app/providers/user_provider.dart';
import 'package:grocery_app/screen/my_profile/my_profile.dart';
import 'package:grocery_app/screen/review_cart/review_cart.dart';
import 'package:grocery_app/screen/wishList/wish_list.dart';

class DrawerSide extends StatefulWidget {
  UserProvider userProvider;
  DrawerSide({required this.userProvider});
  @override
  State<DrawerSide> createState() => _DrawerSideState();
}

class _DrawerSideState extends State<DrawerSide> {
  Widget listTile({IconData? icon, String? title, void Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 32,
      ),
      title: Text(
        title!,
        style: TextStyle(color: Colors.black45),
      ),
    );
  }

  // Widget listTile({String? title,IconData? iconData}){
  @override
  Widget build(BuildContext context) {
    //var userData = widget.userProvider.currentUserData;
    return Drawer(
      child: Container(
        width: 100,
        color: Colors.white,
        child: ListView(
          children: [
            DrawerHeader(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(137, 17, 17, 17),
                      radius: 43,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Color.fromARGB(255, 241, 234, 143),
                        backgroundImage: NetworkImage(
                            "https://lh3.googleusercontent.com/a-/AFdZucphsx3PP7oBBA1cfeghHJlGwDKKMS9dfSiakMsFgQ=s96-c"
                            //userData.userImage
                            ),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Hiten Ydv"
                            // userData.userImage
                            ),
                        Text(
                          "ydvhitender@gmail.com"

                          //userData!.userEmail
                          ,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            listTile(icon: Icons.home_outlined, title: "Home"),
            listTile(
              icon: Icons.shop_two_outlined,
              title: "Review Cart",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ReviewCart(),
                  ),
                );
              },
            ),
            listTile(
              icon: Icons.person_outlined,
              title: "My Profile",
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) =>
                        MyProfile(userProvider: widget.userProvider),
                  ),
                );
              },
            ),
            listTile(icon: Icons.notifications_outlined, title: "Notification"),
            listTile(icon: Icons.star_outline, title: "Rating & Review"),
            listTile(
                icon: Icons.favorite_outline,
                title: "Wishlist",
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => WishList(),
                    ),
                  );
                }),
            listTile(icon: Icons.copy_outlined, title: "Raise a Complaint"),
            listTile(icon: Icons.format_quote_outlined, title: "FAQs"),
            Container(
              height: 350,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Contact Support"),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text("Call us:"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("+91 9350851111")
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text("Mail us:"),
                        SizedBox(
                          width: 10,
                        ),
                        Text("foodgrocery@mail.com")
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
    //),
  }
}
