import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/core/enums/fetch_status.dart';
import 'package:taalim/src/data/firebase/firebase_data.dart';
import 'package:taalim/src/data/model/book_model.dart';

part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(const BooksState());

  Future<void> getBookData() async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));
      final response = await FirebaseData.getBookDataFromFireBaseToo();
      emit(
        state.copyWith(
          fetchStatus: FetchStatus.success,
          bookModel: response,
        ),
      );
    } catch (e) {
      emit(state.copyWith(fetchStatus: FetchStatus.error));
    }
  }
}
