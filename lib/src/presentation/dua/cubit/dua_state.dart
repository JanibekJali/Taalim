part of 'dua_cubit.dart';

class DuaState extends Equatable {
  const DuaState({
    this.status = FetchStatus.loading,
    this.duaModel,
  });
  final List<DuaModel>? duaModel;
  final FetchStatus status;

  @override
  List<Object?> get props => [status, duaModel];
  DuaState copyWith({FetchStatus? status, List<DuaModel>? duaModel}) {
    return DuaState(
      status: status ?? this.status,
      duaModel: duaModel ?? this.duaModel,
    );
  }
}
