import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/model/Category.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          CategoryWidget(
              Category(title: "Clothing", imageUrl: "assets/categs/shirt.png")),
          CategoryWidget(
              Category(title: "Food", imageUrl: "assets/categs/food.png")),
          CategoryWidget(
              Category(title: "Sport", imageUrl: "assets/categs/sport.png")),
          CategoryWidget(Category(
              title: "Phones", imageUrl: "assets/categs/electronics.png")),
          CategoryWidget(Category(
              title: "Media",
              imageUrl: "assets/categs/entertainment.png")),
          CategoryWidget(Category(
              title: "Utensils", imageUrl: "assets/categs/houseware.png")),
        ],
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  Category category;

  CategoryWidget(Category category) {
    this.category = category;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {},
        child: Container(
          width: 100.0,
          child: ListTile(
            contentPadding: EdgeInsets.all(18.0),
            title: Image.asset(
              category.imageUrl,
              width: 100.0,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
                child: Text(category.title,
                  style: TextStyle(color: Colors.black),)),
          ),
        ),
      ),
    );
  }
}
