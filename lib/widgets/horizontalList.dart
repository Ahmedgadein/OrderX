import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ecommerceapp/model/Category.dart';

class HorizontalList extends StatelessWidget {
  final categ_list = Category.Catergory_List;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categ_list.length,
          itemBuilder: (context, index) => CategoryWidget(categ_list[index])),
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
            title: Image.asset(
              category.imageUrl,
              height: 80.0,
              width: 100.0,
            ),
          ),
        ),
      ),
    );
  }
}
