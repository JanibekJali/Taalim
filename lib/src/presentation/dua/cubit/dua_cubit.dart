import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taalim/src/core/enums/fetch_status.dart';
import 'package:taalim/src/core/exception/server_exception.dart';
import 'package:taalim/src/data/firebase/firebase_data.dart';
import 'package:taalim/src/data/model/dua_model.dart';

part 'dua_state.dart';

class DuaCubit extends Cubit<DuaState> {
  DuaCubit() : super(const DuaState());
  Future getDua() async {
    try {
      emit(state.copyWith(status: FetchStatus.loading));
      final response = await FirebaseData.getDuaDataFromFirebase();
      if (response != null) {
        emit(state.copyWith(status: FetchStatus.success, duaModel: response));
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
