class BookModel {
  final String title;

  BookModel({
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      title: map['title'] as String,
    );
  }
}
