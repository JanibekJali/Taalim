import 'package:flutter_bloc/flutter_bloc.dart';

class SubCubit extends Cubit<List<bool>> {
  SubCubit() : super(List.filled(4, false));

  void toggleExpansion(int index) {
    final currentState = state;
    currentState[index] = !currentState[index];
    emit(List.from(currentState));
  }
}
