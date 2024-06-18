part of 'books_cubit.dart';

class BooksState extends Equatable {
  final FetchStatus fetchStatus;
  final List<BookModelToo>? bookModel;

  const BooksState({
    this.fetchStatus = FetchStatus.loading,
    this.bookModel,
  });

  BooksState copyWith({
    FetchStatus? fetchStatus,
    List<BookModelToo>? bookModel,
  }) {
    return BooksState(
      fetchStatus: fetchStatus ?? this.fetchStatus,
      bookModel: bookModel ?? this.bookModel,
    );
  }

  @override
  List<Object?> get props => [fetchStatus, bookModel];
}
