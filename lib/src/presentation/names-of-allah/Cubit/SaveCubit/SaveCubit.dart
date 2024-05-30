import 'package:flutter_bloc/flutter_bloc.dart';

class SaveCubit extends Cubit<List<bool>> {
  SaveCubit() : super(List.filled(4, false));

  void toggleBookmark(int index) {
    final currentState = state;
    currentState[index] = !currentState[index];
    emit(List.from(currentState));
  }
}