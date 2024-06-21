import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taalim/src/core/enums/fetch_status.dart';
import 'package:taalim/src/data/firebase/firebase_data.dart';
import 'package:taalim/src/data/model/book_model.dart';

part 'books_state.dart';

// class BooksCubit extends Cubit<BooksState> {
//   BooksCubit() : super(BooksState());

//   Future getBookData() async {
//     try {
//       emit(state.copyWith(fetchStatus: FetchStatus.loading));
//       final response = await FirebaseData.getBookDataFromFirebase();
//       if (response != null) {
//         emit(
//           state.copyWith(fetchStatus: FetchStatus.success, bookModel: response),
//         );
//       } else {
//         emit(
//           state.copyWith(fetchStatus: FetchStatus.error),
//         );
//       }
//     } catch (e) {
//       throw ServerException('$e');
//     }
//   }
// }

class BooksCubit extends Cubit<BooksState> {
  BooksCubit() : super(const BooksState());

  Future<void> getBookData() async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));
      log('Loading books...');
      final response = await BooksRepository.getBookDataFromFirebase();
      if (response != null) {
        log('Books fetched successfully: $response');
        emit(state.copyWith(fetchStatus: FetchStatus.success, books: response));
      } else {
        log('No books found');
        emit(state.copyWith(fetchStatus: FetchStatus.error));
      }
    } catch (e) {
      log('Error fetching books: $e');
      emit(state.copyWith(fetchStatus: FetchStatus.error));
    }
  }
}
