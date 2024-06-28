import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_nav_bar_state.dart';

class BottomNavBarCubit extends Cubit<BottomNavBarState> {
  BottomNavBarCubit() : super(BottomNavBarState(selectedIndex: 0));

  void onItemTapped(int index) {
    emit(state.copyWith(selectedIndex: index));
  }

  // Удалим неиспользуемый метод updateIndex
}
