import 'package:ecommerceapp/repository/cart_provider.dart';
import 'package:ecommerceapp/repository/user_provider.dart';
import 'package:ecommerceapp/screens/login_page.dart';
import 'package:ecommerceapp/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/screens/Homepage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
      MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (BuildContext context) => UserProvider.initialize(),),
      ChangeNotifierProvider(create: (BuildContext context) => CartProvider.initialize(),),
    ],
    child: MaterialApp(
      home: ScreensController(),
    ),)
  );
}

class ScreensController extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);

    switch (user.status) {
      case Status.Uninitialized:
        return Splash();
        break;

      case Status.Authenticating:
        return Splash();
        break;

      case Status.UnAuthenticated:
        return Login();
        break;

      case Status.Authenticated:
        return HomePage();
        break;
    }
  }
}

