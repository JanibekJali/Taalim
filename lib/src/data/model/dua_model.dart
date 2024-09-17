class DuaModel {
  final String id;
  final String? title;
  final String? arabicText;
  final String? kyrgyzText;
  final String? transcription;
  final String? audio;

  DuaModel({
    required this.id,
    this.title,
    this.arabicText,
    this.kyrgyzText,
    this.transcription,
    this.audio,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'arabicText': arabicText,
      'kyrgyzText': kyrgyzText,
      'transcription': transcription,
      'audio': audio,
    };
  }

  factory DuaModel.fromMap(Map<String, dynamic> map) {
    return DuaModel(
      id: map['id'] as String,
      title: map['title'] != null ? map['title'] as String : null,
      arabicText:
          map['arabicText'] != null ? map['arabicText'] as String : null,
      kyrgyzText:
          map['kyrgyzText'] != null ? map['kyrgyzText'] as String : null,
      transcription:
          map['transcription'] != null ? map['transcription'] as String : null,
      audio: map['audio'] != null ? map['audio'] as String : null,
    );
  }
}
