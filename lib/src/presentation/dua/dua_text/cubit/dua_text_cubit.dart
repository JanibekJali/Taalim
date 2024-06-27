import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:taalim/src/data/model/dua_model.dart';
part 'dua_text_state.dart';

class DuaTextCubit extends Cubit<DuaTextState> {
  DuaTextCubit() : super(const DuaTextState());

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> fetchDuaText() async {
    emit(state.copyWith(loading: true));
    try {
      DocumentSnapshot doc =
          await _firestore.collection('duaTexts').doc('yourDocumentId').get();
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;

      // Fetch audio URL from Firebase Storage if needed
      String audioUrl =
          await FirebaseStorage.instance.ref(data['audio']).getDownloadURL();

      DuaTextModel duaTextModel = DuaTextModel(
        arabicText: data['arabicText'],
        kyrgyzText: data['kyrgyzText'],
        transcriptionText: data['transcriptionText'],
        audio: audioUrl,
      );

      emit(state.copyWith(duaText: duaTextModel, loading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), loading: false));
    }
  }

  Future<void> togglePlayPause() async {
    if (state.isPlaying == true) {
      await _audioPlayer.pause();
      emit(state.copyWith(isPlaying: false));
    } else {
      await _audioPlayer.play(UrlSource(state.duaText!.audio));
      emit(state.copyWith(isPlaying: true));
    }
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
