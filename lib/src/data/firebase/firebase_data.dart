import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taalim/src/core/exception/server_exception.dart';
import 'package:taalim/src/data/firebase/firebase_collection.dart';
import 'package:taalim/src/data/model/book_model.dart';
import 'package:taalim/src/data/model/dua_model.dart';

class FirebaseData {
  // static Future<List<BookModel>?> getBookDataFromFirebase() async {
  //   try {
  //     final books = <BookModel>[];
  //     final response = await FirebaseFirestore.instance
  //         .collection(FirebaseCollection.books)
  //         .where(FirebaseCollection.subHadis)
  //         .get();
  //     for (final element in response.docs) {
  //       books.add(BookModel.fromMap(element.data()));
  //     }
  //     // log('resBookData -> ${books[0].fikh}');
  //     return books;
  //   } catch (e) {
  //     log('Error fetching book data: $e');
  //     throw ServerException(e.toString());
  //   }
  // }
  static Future<List<BookModel>?> getBookDataFromFirebase() async {
    try {
      final books = <BookModel>[];
      final response = await FirebaseFirestore.instance
          .collection(FirebaseCollection.books)
          .where(FirebaseCollection.subHadis)
          .get();
      for (final element in response.docs) {
        books.add(BookModel.fromMap(element.data()));
      }
      // log('resBookData -> ${books[0].fikh}');
      return books;
    } catch (e) {
      log('Error fetching book data: $e');
      throw ServerException(e.toString());
    }
  }

  static Future<List<DuaModel>?> getDuaDataFromFirebase() async {
    try {
      final dua = <DuaModel>[];
      final response = await FirebaseFirestore.instance
          .collection(FirebaseCollection.dualar)
          .get();

      for (final element in response.docs) {
        dua.add(DuaModel.fromMap(element.data()));
      }

      return dua;
    } catch (e) {
      log('Error fetching dua data: $e');
      throw ServerException(e.toString());
    }
  }

  static Future<List<BookModel>?> getBookChoiceDataFromFirebase() async {
    try {
      final bookChoice = <BookModel>[];
      final response = await FirebaseFirestore.instance
          .collection(FirebaseCollection.bookChoice)
          .get();

      for (final element in response.docs) {
        bookChoice.add(BookModel.fromMap(element.data()));
      }

      return bookChoice;
    } catch (e) {
      log('Error fetching dua data: $e');
      throw ServerException(e.toString());
    }
  }
}
