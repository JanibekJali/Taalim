class MusicModel {
  final String musicUrl;
  final String name;

  MusicModel({required this.musicUrl, required this.name});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'musicUrl': musicUrl,
      'name': name,
    };
  }

  factory MusicModel.fromMap(Map<String, dynamic> map) {
    return MusicModel(
      musicUrl: map['musicUrl'] as String,
      name: map['name'] as String,
    );
  }
}
