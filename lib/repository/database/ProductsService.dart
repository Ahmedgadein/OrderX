import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsService {
  Firestore _firestore = Firestore.instance;
  String _collection = "Products";

  Future<List<DocumentSnapshot>> getFeaturedProducts() async {
    List<DocumentSnapshot> docs;

    try {
      await _firestore
          .collection(_collection)
          .where("featured", isEqualTo: true)
          .getDocuments()
          .then((value) => docs = value.documents);
      return docs;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<DocumentSnapshot>> getSimilarProducts(String category) async {
    List<DocumentSnapshot> docs;

    try {
      await _firestore
          .collection(_collection)
          .where("category", isEqualTo: category)
          .getDocuments()
          .then((value) => docs = value.documents);
      return docs;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<DocumentSnapshot>> getRecentProducts() async {
    List<DocumentSnapshot> docs;

    try {
      await _firestore
          .collection(_collection)
          .getDocuments()
          .then((value) => docs = value.documents);
      return docs;
    } catch (e) {
      print(e.toString());
    }
  }
}
