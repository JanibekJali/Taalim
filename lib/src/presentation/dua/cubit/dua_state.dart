part of 'dua_cubit.dart';

// @immutable

abstract class DuaState {}

class DuaInitial extends DuaState {}

class DuaLoading extends DuaState {}

class DuaLoaded extends DuaState {
  final List<DuaModel> duaIndex;

  DuaLoaded(this.duaIndex);
}

class DuaError extends DuaState {
  final String error;

  DuaError(this.error);
}
