part of 'dua_text_cubit.dart';

class DuaTextState extends Equatable {
  final DuaTextModel? duaText;
  final bool loading;
  final String? error;
  final bool isPlaying;

  const DuaTextState({
    this.duaText,
    this.loading = false,
    this.error,
    this.isPlaying = false,
  });

  DuaTextState copyWith({
    DuaTextModel? duaText,
    bool? loading,
    String? error,
    bool? isPlaying,
  }) {
    return DuaTextState(
      duaText: duaText ?? this.duaText,
      loading: loading ?? this.loading,
      error: error ?? this.error,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }

  @override
  List<Object?> get props => [
        duaText,
        loading,
        error,
        isPlaying,
      ];
}
