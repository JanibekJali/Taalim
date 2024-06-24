part of 'books_cubit.dart';

class BooksState extends Equatable {
  const BooksState({
    this.status = FetchStatus.loading,
    this.bookModel,
  });

  final FetchStatus status;
  final List<BookModel>? bookModel;

  @override
  List<Object?> get props => [
        status,
        bookModel,
        // appBarTitle,
      ];

  BooksState copyWith({
    FetchStatus? fetchStatus,
    List<BookModel>? bookModel,
    // String? appBarTitle,
  }) {
    return BooksState(
      status: fetchStatus ?? this.status,
      bookModel: bookModel ?? this.bookModel,
      // appBarTitle: appBarTitle ?? this.appBarTitle,
    );
  }
}
