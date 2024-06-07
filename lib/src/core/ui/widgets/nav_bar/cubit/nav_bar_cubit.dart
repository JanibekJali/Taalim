import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'nav_bar_state.dart';

class NavBarCubit extends Cubit<NavBarState> {
  NavBarCubit() : super(NavBarState(selectedItem: 1));
  void onItemTapped(int index) {
    emit(state.copyWith(selectedItem: index));
  }
}
