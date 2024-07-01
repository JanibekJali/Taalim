import 'package:cloud_firestore/cloud_firestore.dart';

class BookModel {
  final String id;
  final String title;
  final String? content; // Optional content field for more specific models

  BookModel({required this.id, required this.title, this.content});

  factory BookModel.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return BookModel(
      id: doc.id,
      title: data['title'],
      content: data.containsKey('content') ? data['content'] : null,
    );
  }
}
