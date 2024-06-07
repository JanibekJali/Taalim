import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taalim/src/core/enums/fetch_status.dart';
import 'package:taalim/src/core/exception/server_exception.dart';
import 'package:taalim/src/data/firebase/firebase_data.dart';
import 'package:taalim/src/data/model/book_model.dart';
part 'book_choice_state.dart';

class BookChoiceCubit extends Cubit<BookChoiceState> {
  BookChoiceCubit() : super(const BookChoiceState());
  Future getBookChoiceData() async {
    try {
      emit(state.copyWith(status: FetchStatus.loading));
      final response = await FirebaseData.getBookChoiceDataFromFirebase();
      if (response != null) {
        emit(
          state.copyWith(status: FetchStatus.success, bookModel: response),
        );
      } else {
        emit(
          state.copyWith(status: FetchStatus.error),
        );
      }
    } catch (e) {
      throw ServerException('$e');
    }
  }
}
