part of 'bottom_nav_bar_cubit.dart';

class BottomNavBarState extends Equatable {
  BottomNavBarState({this.selectedIndex});
  int? selectedIndex;
  @override
  List<Object?> get props => [selectedIndex];
  BottomNavBarState copyWith({int? selectedIndex}) {
    return BottomNavBarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
