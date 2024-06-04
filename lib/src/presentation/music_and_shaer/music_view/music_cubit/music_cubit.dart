import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'music_state.dart';

class MusicCubit extends Cubit<MusicState> {
  MusicCubit() : super(MusicInitial(musicDocuments: []));

  Future<void> getMusicDocuments() async {
    try {
      emit(MusicLoading());
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('music').get();
      emit(MusicInitial(musicDocuments: querySnapshot.docs));
    } catch (e) {
      emit(MusicError(error: e.toString()));
    }
  }
}
