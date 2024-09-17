import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/core/ui/widgets/audio/cubit/audio_player_state.dart';

class AudioPlayerCubit extends Cubit<AudioPlayerState> {
  final AudioPlayer _audioPlayer;

  AudioPlayerCubit()
      : _audioPlayer = AudioPlayer(),
        super(AudioPlayerInitial()) {
    // Listen for when the audio completes
    _audioPlayer.onPlayerComplete.listen((event) {
      stop();
    });
  }

  Future<void> play(String audioUrl) async {
    await _audioPlayer.setSourceUrl(audioUrl);
    await _audioPlayer.resume();
    emit(AudioPlayerPlaying());
  }

  Future<void> pause() async {
    await _audioPlayer.pause();
    emit(AudioPlayerPaused());
  }

  Future<void> stop() async {
    await _audioPlayer.stop();
    emit(AudioPlayerStopped());
  }

  @override
  Future<void> close() {
    _audioPlayer.dispose();
    return super.close();
  }
}
