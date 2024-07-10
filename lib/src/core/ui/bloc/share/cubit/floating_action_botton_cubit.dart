import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'floating_action_botton_state.dart';

class FloatingActionBottonCubit extends Cubit<FloatingActionBottonState> {
  FloatingActionBottonCubit() : super(FloatingActionBottonStateClosed());

  void toggle() {
    if (state is FloatingActionBottonStateClosed) {
      emit(FloatingActionBottonStateOpened());
    } else {
      emit(FloatingActionBottonStateClosed());
    }
  }
}
