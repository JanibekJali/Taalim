part of 'book_choice_cubit.dart';

class BookChoiceState extends Equatable {
  const BookChoiceState({
    this.status = FetchStatus.loading,
    this.bookModel,
  });
  final FetchStatus status;
  final List<BookModel>? bookModel;
  @override
  List<Object?> get props => [status, bookModel];
  BookChoiceState copyWith({
    FetchStatus? status,
    List<BookModel>? bookModel,
  }) {
    return BookChoiceState(
      status: status ?? this.status,
      bookModel: bookModel ?? this.bookModel,
    );
  }
}
