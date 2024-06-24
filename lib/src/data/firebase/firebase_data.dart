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
      final response =
          await FirebaseFirestore.instance.collection(collectionName).get();
      for (final element in response.docs) {
        books.add(BookModel.fromMap(element.data()));
      }
      return books;
    } catch (e) {
      log('Error fetching data from $collectionName: $e');
      throw ServerException(e.toString());
    }
  }

  static Future<List<DuaModel>?> getDuaDataFromFirebase(
      String collectionName) async {
    try {
      final dualar = <DuaModel>[];
      final response =
          await FirebaseFirestore.instance.collection(collectionName).get();
      for (var dua in response.docs) {
        dualar.add(DuaModel.fromMap(dua.data()));
      }
      return dualar;
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
