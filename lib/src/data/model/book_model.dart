class BookModel {
  // final String id;
  final String fikh;
  // final String hadis;
  // final String siro;
  // final String title;

  BookModel({
    // required this.id,
    required this.fikh,
    // required this.hadis,
    // required this.siro,
    // required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      // 'id': id,
      'fikh': fikh,
      // 'hadis': hadis,
      // 'siro': siro,
      // 'title': title,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      // id: map['id'] as String,
      fikh: map['fikh'] as String,
      // hadis: map['hadis'] as String,
      // siro: map['siro'] as String,
      // title: map['title'] as String,
    );
  }
}
