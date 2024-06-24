import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taalim/src/core/exception/server_exception.dart';
import 'package:taalim/src/data/firebase/firebase_collection.dart';
import 'package:taalim/src/data/model/book_model.dart';
import 'package:taalim/src/data/model/dua_model.dart';
import 'package:taalim/src/data/model/question_answer_model.dart';

class FirebaseData {
  static Future<List<BookModel>?> getBookDataFromFirebase(
      String collectionName) async {
    try {
      final books = <BookModel>[];
      await _fetchCollection(
          FirebaseFirestore.instance.collection(collectionName), books);
      return books;
    } catch (e) {
      log('Error fetching data from $collectionName: $e');
      throw ServerException(e.toString());
    }
  }

  static Future<void> _fetchCollection(
      CollectionReference collection, List<BookModel> books) async {
    final response = await collection.get();
    for (final element in response.docs) {
      final data = element.data() as Map<String, dynamic>;
      // Add the current document to the list if it contains a title field
      if (data.containsKey('title')) {
        books.add(BookModel.fromMap(data));
      }

      // Recursively fetch nested collections
      await _fetchNestedCollections(element.reference, books);
    }
  }

  static Future<void> _fetchNestedCollections(
      DocumentReference docRef, List<BookModel> books) async {
    final subcollections =
        await docRef.firestore.collectionGroup(docRef.id).get();
    for (final subDoc in subcollections.docs) {
      final subData = subDoc.data() as Map<String, dynamic>;
      if (subData.containsKey('title')) {
        books.add(BookModel.fromMap(subData));
      }
    }
  }
  // static Future<List<BookModel>?> getBookDataFromFirebase(
  //     String collectionName) async {
  //   try {
  //     final books = <BookModel>[];
  //     final response =
  //         await FirebaseFirestore.instance.collection(collectionName).get();
  //     for (final element in response.docs) {
  //       books.add(BookModel.fromMap(element.data()));
  //     }
  //     return books;
  //   } catch (e) {
  //     log('Error fetching data from $collectionName: $e');
  //     throw ServerException(e.toString());
  //   }
  // }

  static Future<List<DuaModel>?> getDuaDataFromFirebase(
    String collection,
  ) async {
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

  static Future<List<DuaModel>?> getDuaSelectionDataFromFirebase() async {
    try {
      final duas = <DuaModel>[];
      final response = await FirebaseFirestore.instance
          .collection(FirebaseCollection.quranicDuas)
          .get();
      for (final element in response.docs) {
        duas.add(DuaModel.fromMap(element.data()));
      }
      return duas;
    } catch (e) {
      log('Error fetching book data: $e');
      throw ServerException(e.toString());
    }
  }

  static Future<List<QuestionAnswerModel>?>
      getQuestionAnswerDataFromFirebase() async {
    try {
      final questionAnswer = <QuestionAnswerModel>[];
      final response = await FirebaseFirestore.instance
          .collection(FirebaseCollection.aalym)
          .get();
      for (var aalym in response.docs) {
        questionAnswer.add(QuestionAnswerModel.fromMap(aalym.data()));
      }
      return questionAnswer;
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
      return books;
    } catch (e) {
      log('Error fetching book data: $e');
      throw ServerException(e.toString());
    }
  }
}

class FirebaseData1 {
  // Fetch main collection data
  static Future<List<BookModel>?> getDataFromFirebase(
      String collectionName) async {
    try {
      final books = <BookModel>[];
      final response =
          await FirebaseFirestore.instance.collection(collectionName).get();
      for (final element in response.docs) {
        final data = element.data() as Map<String, dynamic>;
        if (data.containsKey('title')) {
          books.add(BookModel.fromMap(data));
        }
      }
      return books;
    } catch (e) {
      log('Error fetching data from $collectionName: $e');
      throw ServerException(e.toString());
    }
  }

  // Fetch data from a single subcollection
  static Future<List<BookModel>> getSubcollectionData(
      String parentDocPath, String subcollectionName) async {
    try {
      final books = <BookModel>[];
      final response = await FirebaseFirestore.instance
          .doc(parentDocPath)
          .collection(subcollectionName)
          .get();
      for (final element in response.docs) {
        final data = element.data() as Map<String, dynamic>;
        if (data.containsKey('title')) {
          books.add(BookModel.fromMap(data));
        }
      }
      return books;
    } catch (e) {
      log('Error fetching subcollection data: $e');
      throw ServerException(e.toString());
    }
  }

  // Fetch data from multiple subcollections
  static Future<List<BookModel>> getSubcollectionsData(
      String parentDocPath, List<String> subcollectionNames) async {
    final books = <BookModel>[];
    for (final subcollectionName in subcollectionNames) {
      final subcollectionBooks =
          await getSubcollectionData(parentDocPath, subcollectionName);
      books.addAll(subcollectionBooks);
    }
    return books;
  }
}
