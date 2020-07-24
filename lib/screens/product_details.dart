import 'package:ecommerceapp/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final Product product;

  ProductDetails({this.product});

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ======== Appbar ==========
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Center(
          child: GestureDetector(
              child: Text("Sudan OrderX"),
          onTap: (){Navigator.of(context).pop(context);},),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
      ),

      //============ Body =============
      body: ListView(
        children: <Widget>[
          Container(
            height: 300.0,
            child: GridTile(
              child: Container(
                  color: Colors.white,
                  child: Image.network(widget.product.pic2)),
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: Text(
                    widget.product.name,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  title: Row(
                    children: <Widget>[
                      !widget.product.onSale ? Expanded(child: Text(""),) :Expanded(
                        child: Text(
                          "\$" + widget.product.oldPrice.toString(),
                          style: TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "\$" + widget.product.price.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red[800],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          // ======== Size, Color and Quantity selection ======
          Row(
            children: <Widget>[
              //Size button
              Expanded(
                child: MaterialButton(
                  textColor: Colors.grey,
                  elevation: 0.2,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Size"),
                            content: Text("Choose size"),
                            actions: <Widget>[
                              MaterialButton(
                                child: Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Size"),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),

              //Color button
              Expanded(
                child: MaterialButton(
                  textColor: Colors.grey,
                  elevation: 0.2,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Color"),
                            content: Text("Choose Color"),
                            actions: <Widget>[
                              MaterialButton(
                                child: Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Color"),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),

              //Quantity button
              Expanded(
                child: MaterialButton(
                  textColor: Colors.grey,
                  elevation: 0.2,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Quantity"),
                            content: Text("Choose quantity"),
                            actions: <Widget>[
                              MaterialButton(
                                child: Text("Close"),
                                onPressed: () {
                                  Navigator.of(context).pop(context);
                                },
                              )
                            ],
                          );
                        });
                  },
                  color: Colors.white,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text("Qty"),
                      ),
                      Expanded(
                        child: Icon(Icons.arrow_drop_down),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

//     =============== Buy Now Button =====================
          Row(
            children: <Widget>[
              Expanded(
                child: MaterialButton(
                  textColor: Colors.white,
                  elevation: 0.2,
                  onPressed: () {},
                  color: Colors.deepPurple,
                  child: Text("Buy now"),
                ),
              ),

              // Cart Icon
              IconButton(
                color: Colors.deepPurple,
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.deepPurple,
                ),
              ),

              //Favourite Icon
              IconButton(
                color: Colors.deepPurple,
                icon: Icon(
                  Icons.favorite_border,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          Divider(),



 // ================== Product detail ===========================
          ListTile(
            title: Text("Product details"),
            subtitle: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Condimentum vitae sapien pellentesque habitant morbi tristique. Metus vulputate eu scelerisque felis imperdiet proin fermentum leo vel. Tristique senectus et netus et malesuada fames ac. Nisi est sit amet facilisis magna etiam tempor orci. Dolor purus non enim praesent elementum facilisis. Pellentesque elit ullamcorper dignissim cras tincidunt lobortis feugiat. Eget egestas purus viverra accumsan in. Magna fringilla urna porttitor rhoncus dolor purus non enim. Sit amet aliquam id diam maecenas. Fames ac turpis egestas integer eget aliquet. Proin libero nunc consequat interdum varius sit amet mattis."),
          ),
          Divider(),
          Row(
            children: <Widget>[


              //Product name
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Product name",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0),
              child: Text(widget.product.name.toString()),)
            ],
          ),


          //Product brand
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Product brand",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.product.brand),
              )
            ],
          ),


          //Product condition
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15.0, 5.0, 5.0, 5.0),
                child: Text(
                  "Product condition",
                  style: TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(padding: EdgeInsets.all(5.0),
              child: Text(widget.product.isNew ? "New" : "Used"),)
            ],
          ),

          Divider(),

          Padding(
            padding: EdgeInsets.fromLTRB(15.0, 10.0 , 0, 10.0),
            child: Text("Similar Products", style: TextStyle(fontSize: 18.0, color: Colors.grey[700]),),
          ),


  // ============= Similar Products ======================
          Container(
              height: 320.0,
              child: SimilarProducts())
        ],
      ),
    );
  }
}

class SimilarProducts extends StatefulWidget {
  static List _product_list = List<Product>();

  @override
  _SimilarProductsState createState() => _SimilarProductsState();
}

class _SimilarProductsState extends State<SimilarProducts> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: SimilarProducts._product_list.length,
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int position) {
          return SingleSimilarProduct(SimilarProducts._product_list[position]);
        });
  }
}

class SingleSimilarProduct extends StatelessWidget {
  Product product;

  SingleSimilarProduct(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
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
                product.Pic1,
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

