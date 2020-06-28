class Category {
  String imageUrl;
  String title;

  Category({this.imageUrl, this.title});

  static List Catergory_List = [
  Category(title: "Clothing", imageUrl: "assets/categs/shirt.png"),
    Category(title: "Food", imageUrl: "assets/categs/food.png"),
    Category(title: "Sport", imageUrl: "assets/categs/sport.png"),
    Category(title: "Phones", imageUrl: "assets/categs/electronics.png"),
    Category(title: "Media", imageUrl: "assets/categs/entertainment.png"),
    Category(title: "Utensils", imageUrl: "assets/categs/houseware.png")
  ];

}