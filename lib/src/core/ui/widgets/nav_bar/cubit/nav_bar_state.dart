part of 'nav_bar_cubit.dart';

class NavBarState extends Equatable {
  int? selectedItem;
  NavBarState({
    this.selectedItem,
  });

  @override
  List<Object?> get props => [selectedItem];
  NavBarState copyWith({int? selectedItem}) {
    return NavBarState(selectedItem: selectedItem ?? this.selectedItem);
  }
}
