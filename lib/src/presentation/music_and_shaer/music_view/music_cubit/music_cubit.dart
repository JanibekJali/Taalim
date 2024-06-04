import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/presentation/music_and_shaer/music_view/model/music_model.dart';

part 'music_state.dart';

class MusicCubit extends Cubit<MusicState> {
  MusicCubit() : super(MusicInitial(musicList: []));

  Future<void> getMusicDocuments() async {
    try {
      emit(MusicLoading());
      final QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('music').get();

      final musicList = querySnapshot.docs
          .map((doc) => MusicModel.fromMap(doc.data() as Map<String, dynamic>))
          .toList();
      emit(MusicInitial(musicList: musicList));
    } catch (e) {
      emit(MusicError(error: e.toString()));
    }
  }
}
