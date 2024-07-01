import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:taalim/src/data/firebase/firebase_collection.dart';
import 'package:taalim/src/data/model/book_model.dart';
import 'package:taalim/src/data/repositories/book_repo.dart';
part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(BooksInitial());

  Future<void> fetchBooks() async {
    try {
      emit(BookLoading());
      List<BookModel> items =
          await BookRepository.fetchCollection(FirebaseCollection.book);
      log('Fetched books: ${items.map((e) => e.title).toList()}');
      emit(BooksLoaded(items));
    } catch (e) {
      log('Error fetching books: $e');
      emit(BookError(e.toString()));
    }
  }

  Future<void> fetchNestedCollection(String path) async {
    try {
      emit(BookLoading());
      log('Fetching data from path: $path');
      List<BookModel> items = await BookRepository.fetchCollection(path);
      log('Fetched items: ${items.length}');
      emit(NestedCollectionLoaded(items));
    } catch (e) {
      log('Error fetching nested collection from $path: $e');
      emit(BookError(e.toString()));
    }
  }

  Future<void> fetchDocument(String path) async {
    try {
      emit(BookLoading());
      var doc = await BookRepository.fetchDocument(path);
      log('Fetched document from path: $path');
      emit(DocumentLoaded(doc));
    } catch (e) {
      log('Error fetching document from $path: $e');
      emit(BookError(e.toString()));
    }
  }
}
