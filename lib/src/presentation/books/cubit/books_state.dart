part of 'books_cubit.dart';

abstract class BooksState {}

class BooksInitial extends BooksState {}

class BookLoading extends BooksState {}

class BooksLoaded extends BooksState {
  final List<BookModel> items;

  BooksLoaded(this.items);
}

class NestedCollectionLoaded extends BooksState {
  final List<BookModel> items;

  NestedCollectionLoaded(this.items);
}

class DocumentLoaded extends BooksState {
  final BookModel item;

  DocumentLoaded(this.item);
}

class BookError extends BooksState {
  final String error;

  BookError(this.error);
}
