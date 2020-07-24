import 'package:ecommerceapp/model/product.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/screens/product_details.dart';

class Products extends StatefulWidget {
  static List _product_list = List<Product>();

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
          return Padding(
              padding: EdgeInsets.all(4.0),
              child: SingleProduct(Products._product_list[position]));
        });
  }
}

class SingleProduct extends StatelessWidget {
  Product product;

  SingleProduct(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Hero(
        tag: product.name,
        child: Material(
          child: InkWell(
            onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
              builder: (context)=> ProductDetails(
                product: this.product,
              ),
            )),
            child: GridTile(
              child: Image.network(
                product.pic2,
                fit: BoxFit.cover,
              ),
              footer: Container(
                color: Colors.white70,
                child: Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),),
                      ),
                      Text(
                        "\$" + product.price.toString(),
                        style: TextStyle(color: Colors.deepPurple[500], fontWeight: FontWeight.bold),
                      )
                    ],
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
