import 'package:flutter/material.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            onTap: () {},
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
                color: Colors.grey[900],
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
                color: Colors.deepPurple[900],
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
                Icons.shopping_cart,
                color: Colors.green,
              ),
            ),
          ),
          InkWell(
            onTap: () {},
            child: ListTile(
              title: Text(
                "Categories",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700]),
              ),
              leading: Icon(
                Icons.dashboard,
                color: Colors.orange[900],
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
                color: Colors.red,
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
                color: Colors.brown[700],
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
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
