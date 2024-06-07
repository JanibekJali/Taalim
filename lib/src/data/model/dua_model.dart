class DuaModel {
  final String dua;

  DuaModel({
    required this.dua,
  });

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
