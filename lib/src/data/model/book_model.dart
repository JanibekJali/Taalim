class BookModel {
  final String bookName;

  BookModel({
    required this.bookName,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookName': bookName,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      bookName: map['bookName'] as String,
    );
  }
}
