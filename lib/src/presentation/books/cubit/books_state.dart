part of 'books_cubit.dart';

// class BooksState extends Equatable {
//   const BooksState({
//     this.fetchStatus = FetchStatus.loading,
//     this.bookModel,
//   });
//   final FetchStatus fetchStatus;
//   final List<BookModel>? bookModel;
//   @override
//   List<Object?> get props => [fetchStatus, bookModel];
//   BooksState copyWith({
//     FetchStatus? fetchStatus,
//     List<BookModel>? bookModel,
//   }) {
//     return BooksState(
//       fetchStatus: fetchStatus ?? this.fetchStatus,
//       bookModel: bookModel ?? this.bookModel,
//     );
//   }
// }

//

class BooksState extends Equatable {
  const BooksState({
    this.fetchStatus = FetchStatus.loading,
    this.books,
  });

  final FetchStatus fetchStatus;
  final List<BookModel>? books;

  @override
  List<Object?> get props => [fetchStatus, books];

  BooksState copyWith({
    FetchStatus? fetchStatus,
    List<BookModel>? books,
  }) {
    return BooksState(
      fetchStatus: fetchStatus ?? this.fetchStatus,
      books: books ?? this.books,
    );
  }
}
