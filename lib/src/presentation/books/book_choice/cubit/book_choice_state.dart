part of 'book_choice_cubit.dart';

sealed class BookChoiceState extends Equatable {
  const BookChoiceState();

  @override
  List<Object> get props => [];
}

final class BookChoiceInitial extends BookChoiceState {}
