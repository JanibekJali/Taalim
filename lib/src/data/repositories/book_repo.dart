import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taalim/src/data/model/book_model.dart';

class BookRepository {
  static Future<List<BookModel>> fetchCollection(String path) async {
    var snapshot = await FirebaseFirestore.instance.collection(path).get();
    return snapshot.docs.map((doc) => BookModel.fromDocument(doc)).toList();
  }

  static Future<BookModel> fetchDocument(String path) async {
    var document = await FirebaseFirestore.instance.doc(path).get();
    return BookModel.fromDocument(document);
  }
}
