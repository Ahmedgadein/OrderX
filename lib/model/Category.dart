class Category{
  String imageUrl;
  String title;
  Category({this.imageUrl,this.title});

  static List<dynamic> categories =
  [
    Category(imageUrl:"assets/categories/shirt.svg",title: "Clothing" ),
    Category(imageUrl:"assets/categories/food.svg",title: "Food" ),
    Category(imageUrl:"assets/categories/sport.svg",title: "Sports" ),
    Category(imageUrl:"assets/categories/electronics.svg",title: "Electronics" ),
    Category(imageUrl:"assets/categories/entertainment.svg",title: "entertainment" ),
    Category(imageUrl:"assets/categories/houseware.svg",title: "Houseware" ),

  ];
}