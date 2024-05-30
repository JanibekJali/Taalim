import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'book_choice_state.dart';

class BookChoiceCubit extends Cubit<BookChoiceState> {
  BookChoiceCubit() : super(BookChoiceInitial());
}
