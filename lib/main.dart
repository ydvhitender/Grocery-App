import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';

import 'package:grocery_app/auth/sign_in.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:grocery_app/providers/check_out_provider.dart';
import 'package:grocery_app/providers/product_provider.dart';
import 'package:grocery_app/providers/review_cart_provider.dart';
import 'package:grocery_app/providers/user_provider.dart';
import 'package:grocery_app/providers/wish_list_provider.dart';

import 'package:grocery_app/screen/home/home_screen.dart';

import 'package:grocery_app/screen/product_overview/product_overview.dart';
import 'package:provider/provider.dart';

import 'config/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductProvider>(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider<UserProvider>(
          create: (context) => UserProvider(),
        ),
        ChangeNotifierProvider<ReviewCartProvider>(
          create: (context) => ReviewCartProvider(),
        ),
        ChangeNotifierProvider<WishListProvider>(
          create: (context) => WishListProvider(),
        ),
        ChangeNotifierProvider<CheckoutProvider>(
          create: (context) => CheckoutProvider(),
        ),
      ],
      child: MaterialApp(
        //title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: primaryColor,
          scaffoldBackgroundColor: scaffoldBackgroundColor,
        ),
        debugShowCheckedModeBanner: false,
        home: SignIn(),
      ),
    );
  }
}
