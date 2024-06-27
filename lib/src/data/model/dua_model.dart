class DuaModel {
  final String dua;

  DuaModel({required this.dua});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dua': dua,
    };
  }

  factory DuaModel.fromMap(Map<String, dynamic> map) {
    return DuaModel(
      dua: map['dua'] as String,
    );
  }
}

class DuaTextModel {
  final String arabicText;
  final String kyrgyzText;
  final String transcriptionText;
  final String audio;

  DuaTextModel({
    required this.arabicText,
    required this.kyrgyzText,
    required this.transcriptionText,
    required this.audio,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'arabicText': arabicText,
      'kyrgyzText': kyrgyzText,
      'transcriptionText': transcriptionText,
      'audio': audio,
    };
  }

  factory DuaTextModel.fromMap(Map<String, dynamic> map) {
    return DuaTextModel(
      arabicText: map['arabicText'] as String,
      kyrgyzText: map['kyrgyzText'] as String,
      transcriptionText: map['transcriptionText'] as String,
      audio: map['audio'] as String,
    );
  }
}
