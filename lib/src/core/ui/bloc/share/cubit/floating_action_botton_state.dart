part of 'floating_action_botton_cubit.dart';

abstract class FloatingActionBottonState extends Equatable {
  const FloatingActionBottonState();

  @override
  List<Object> get props => [];
}

class FloatingActionBottonStateClosed extends FloatingActionBottonState {}

class FloatingActionBottonStateOpened extends FloatingActionBottonState {}
