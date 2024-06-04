part of 'music_cubit.dart';

abstract class MusicState {}

class MusicLoading extends MusicState {}

class MusicInitial extends MusicState {
  final List<QueryDocumentSnapshot> musicDocuments;

  MusicInitial({required this.musicDocuments});
}

class MusicPlaying extends MusicState {
  final String musicUrl;
  final Duration duration;
  final Duration position;
  final List<QueryDocumentSnapshot> musicDocuments;

  MusicPlaying(
    this.musicDocuments, {
    required this.musicUrl,
    required this.duration,
    required this.position,
  });
}

class MusicPaused extends MusicState {
  final String musicUrl;
  final Duration duration;
  final Duration position;

  MusicPaused({
    required this.musicUrl,
    required this.duration,
    required this.position,
  });
}

class MusicStopped extends MusicState {}

class MusicError extends MusicState {
  final String error;

  MusicError({required this.error});
}
