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
  //   } catch (e) { x
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

  static Future<List<DuaModel>?> getDuaDataFromFirebase(
    String collection,
  ) async {
    // FirebaseCollection.dualar
    try {
      final dualar = <DuaModel>[];
      final response =
          await FirebaseFirestore.instance.collection(collection).get();
      for (var dua in response.docs) {
        dualar.add(DuaModel.fromMap(dua.data()));
      }
      return dualar;
    } catch (e) {
      log('Error fetching book data: $e');
      throw ServerException(e.toString());
    }
  }

  static Future<List<BookModel>?> getKuranDuaDataFromFirebase() async {
    try {
      final books = <BookModel>[];
      final response = await FirebaseFirestore.instance
          .collection(FirebaseCollection.dualar)
          .where(FirebaseCollection.kuranDua)
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
}
