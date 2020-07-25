import 'package:ecommerceapp/repository/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/screens/shopping_cart.dart';
import 'package:provider/provider.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    return Drawer(
      child: ListView(
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text("Ahmed Gadein"),
            accountEmail: Text("ahmedgadein@gmail.com"),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            ),
            decoration: BoxDecoration(color: Colors.deepPurple),
          ),

          InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: ListTile(
              title: Text(
                "Home Page",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              leading: Icon(
                Icons.home,
                color: Colors.deepPurple[700],
              ),
            ),
          ),


          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text(
                "My accounts",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              leading: Icon(
                Icons.person,
                color: Colors.deepPurple[700],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text(
                "My Orders",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              leading: Icon(
                Icons.shopping_basket,
                color: Colors.deepPurple[700],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => ShoppingCart()));
            },
            child: ListTile(
              title: Text(
                "Shopping Cart",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              leading: Icon(
                Icons.shopping_cart,
                color: Colors.deepPurple[700],
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text(
                "Favourites",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              leading: Icon(
                Icons.favorite,
                color: Colors.deepPurple[700],
              ),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text(
                "Settings",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              leading: Icon(
                Icons.settings,
                color: Colors.blueGrey,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text(
                "About",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              leading: Icon(
                Icons.info,
                color: Colors.blueGrey,
              ),
            ),
          ),
          Divider(),
          InkWell(
            onTap: () {
              user.signOut();
            },
            child: ListTile(
              title: Text(
                "Sign Out",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              leading: Icon(
                Icons.subdirectory_arrow_left,
                color: Colors.red[800],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
