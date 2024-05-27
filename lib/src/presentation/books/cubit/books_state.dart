part of 'books_cubit.dart';

class BooksState extends Equatable {
  const BooksState({this.fetchStatus = FetchStatus.loading, this.bookModel});
  final FetchStatus fetchStatus;
  final List<BookModel>? bookModel;
  @override
  List<Object> get props => [fetchStatus, bookModel!];
  BooksState copyWith({FetchStatus? fetchStatus, List<BookModel>? bookModel}) {
    return BooksState(
      fetchStatus: fetchStatus ?? this.fetchStatus,
      bookModel: bookModel ?? this.bookModel,
    );
  }
}
