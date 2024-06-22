import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taalim/src/core/enums/fetch_status.dart';
import 'package:taalim/src/core/exception/server_exception.dart';
import 'package:taalim/src/data/firebase/firebase_data.dart';
import 'package:taalim/src/data/model/book_model.dart';
part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(const BooksState());

  Future<void> getBookData(String collectionName) async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));
      final response =
          await FirebaseData.getBookDataFromFirebase(collectionName);
      if (response != null && response.isNotEmpty) {
        emit(
          state.copyWith(
            fetchStatus: FetchStatus.success,
            bookModel: response,
            // appBarTitle: response.first.appBarTitle ??
            // 'Default Title',
          ),
        );
      } else {
        emit(state.copyWith(fetchStatus: FetchStatus.error));
      }
    } catch (e) {
      emit(state.copyWith(fetchStatus: FetchStatus.error));
      throw ServerException('$e');
    }
  }
}
