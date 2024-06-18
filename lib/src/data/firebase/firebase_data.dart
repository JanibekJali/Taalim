import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taalim/src/core/exception/server_exception.dart';
import 'package:taalim/src/data/firebase/firebase_collection.dart';
import 'package:taalim/src/data/model/book_model.dart';

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

  static Future<List<BookModelToo>> getBookDataFromFireBaseToo() async {
    try {
      final books = <BookModelToo>[];
      final response = await FirebaseFirestore.instance
          .collection(FirebaseCollection.customBooks)
          .get();

      for (final element in response.docs) {
        final bookData = element.data();
        final book = BookModelToo.fromMap(bookData);

        final subCollectionResponse = await element.reference
            .collection(FirebaseCollection.customsubBooks)
            .get();

        final subBooks = <SubBookModel>[];
        for (final subElement in subCollectionResponse.docs) {
          final subBookData = subElement.data();
          final subBook = SubBookModel.fromMap(subBookData);

          final subSubCollectionResponse = await subElement.reference
              .collection(FirebaseCollection.customsubMuhatsar)
              .get();

          final subSubBooks = <SubSubBookModel>[];
          for (final subSubElement in subSubCollectionResponse.docs) {
            final subSubBookData = subSubElement.data();
            final subSubBook = SubSubBookModel.fromMap(subSubBookData);

            final subSubSubCollectionResponse = await subSubElement.reference
                .collection(FirebaseCollection.customsubMuhatsar1)
                .get();

            final subSubSubBooks = <SubSubSubBookModel>[];
            for (final subSubSubElement in subSubSubCollectionResponse.docs) {
              final subSubSubBookData = subSubSubElement.data();
              final subSubSubBook =
                  SubSubSubBookModel.fromMap(subSubSubBookData);

              final subSubSubSubCollectionResponse = await subSubSubElement
                  .reference
                  .collection(FirebaseCollection.customsubDaarat)
                  .get();

              final subSubSubSubBooks = <SubSubSubSubBookModel>[];
              for (final subSubSubSubElement
                  in subSubSubSubCollectionResponse.docs) {
                final subSubSubSubBookData = subSubSubSubElement.data();
                final subSubSubSubBook =
                    SubSubSubSubBookModel.fromMap(subSubSubSubBookData);

                final subSubSubSubSubCollectionResponse =
                    await subSubSubSubElement.reference
                        .collection(FirebaseCollection.overCollections)
                        .get();

                final subSubSubSubSubBooks = <OverSubCollections>[];
                for (final subSubSubSubSubElement
                    in subSubSubSubSubCollectionResponse.docs) {
                  final subSubSubSubSubBookData = subSubSubSubSubElement.data();
                  subSubSubSubSubBooks
                      .add(OverSubCollections.fromMap(subSubSubSubSubBookData));
                }

                subSubSubSubBooks.add(SubSubSubSubBookModel(
                  subSubSubSubBook: subSubSubSubBook.subSubSubSubBook,
                  overBook: subSubSubSubSubBooks,
                ));
              }

              subSubSubBooks.add(SubSubSubBookModel(
                subSubSubBook: subSubSubBook.subSubSubBook,
                subSubSubSubBooks: subSubSubSubBooks,
              ));
            }

            subSubBooks.add(SubSubBookModel(
              subSubBook: subSubBook.subSubBook,
              subSubSubBooks: subSubSubBooks,
            ));
          }

          subBooks.add(SubBookModel(
            subBook: subBook.subBook,
            subSubBooks: subSubBooks,
          ));
        }

        books.add(BookModelToo(
          bookName: book.bookName,
          subBooks: subBooks,
        ));
      }

      return books;
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
