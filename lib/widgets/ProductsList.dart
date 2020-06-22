import 'package:ecommerceapp/model/product.dart';
import 'package:flutter/material.dart';

class Products extends StatefulWidget {
  static List _product_list = Product.ProductsList;

  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: Products._product_list.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int position) {
          return SingleProduct(Products._product_list[position]);
        });
  }
}

class SingleProduct extends StatelessWidget {
  Product product;

  SingleProduct(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag: product.name,
        child: Material(
          child: InkWell(
            onTap: () {},
            child: GridTile(
              child: Image.asset(
                product.picture,
                fit: BoxFit.cover,
              ),
              footer: Container(
                color: Colors.white70,
                child: ListTile(
                  title: Text(
                    "\$" + product.price.toString(),
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    "\$" + product.oldPrice.toString(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.lineThrough),
                  ),
                  leading: Text(
                    product.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
