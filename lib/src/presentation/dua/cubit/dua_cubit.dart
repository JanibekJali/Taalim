import 'package:bloc/bloc.dart';
import 'package:taalim/src/data/model/dua_model.dart';
import 'package:taalim/src/data/repositories/dua_repo.dart';

part 'dua_state.dart';

class DuaCubit extends Cubit<DuaState> {
  final DuaRepo repository;

  DuaCubit(this.repository) : super(DuaInitial());

  Future<void> getDua() async {
    try {
      emit(DuaLoading());
      final numbers = await repository.fetchDua();
      emit(DuaLoaded(numbers));
    } catch (e) {
      emit(DuaError(e.toString()));
    }
  }

  Future<void> getDuaSelection(String parentKey) async {
    try {
      emit(DuaLoading());
      final subNumbers = await repository.fetchDuaSelection(parentKey);
      emit(DuaLoaded(subNumbers));
    } catch (e) {
      emit(DuaError(e.toString()));
    }
  }
}
