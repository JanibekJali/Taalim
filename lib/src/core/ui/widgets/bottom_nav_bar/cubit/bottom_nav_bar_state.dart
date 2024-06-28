part of 'bottom_nav_bar_cubit.dart';

class BottomNavBarState extends Equatable {
  final int selectedIndex;

  BottomNavBarState({required this.selectedIndex});

  @override
  List<Object?> get props => [selectedIndex];

  // Возвращаем индекс напрямую
  int get index => selectedIndex;

  BottomNavBarState copyWith({int? selectedIndex}) {
    return BottomNavBarState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}
