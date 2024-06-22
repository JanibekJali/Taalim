part of 'books_cubit.dart';

class BooksState extends Equatable {
  const BooksState({
    this.fetchStatus = FetchStatus.loading,
    this.bookModel,
    // this.appBarTitle = '',
  });

  final FetchStatus fetchStatus;
  final List<BookModel>? bookModel;
  // final String appBarTitle;

  @override
  List<Object?> get props => [
        fetchStatus,
        bookModel,
        // appBarTitle,
      ];

  BooksState copyWith({
    FetchStatus? fetchStatus,
    List<BookModel>? bookModel,
    // String? appBarTitle,
  }) {
    return BooksState(
      fetchStatus: fetchStatus ?? this.fetchStatus,
      bookModel: bookModel ?? this.bookModel,
      // appBarTitle: appBarTitle ?? this.appBarTitle,
    );
  }
}
