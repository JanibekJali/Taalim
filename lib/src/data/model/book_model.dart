// class BookModel {
//   final String bookName;

//   BookModel({
//     required this.bookName,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'bookName': bookName,
//     };
//   }

//   factory BookModel.fromMap(Map<String, dynamic> map) {
//     return BookModel(
//       bookName: map['bookName'] as String,
//     );
//   }
// }

class BookModel {
  final String title;
  final List<String> chapters;
  final String finalText;

  BookModel({
    required this.title,
    required this.chapters,
    required this.finalText,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'chapters': chapters,
      'finalText': finalText,
    };
  }

  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      title: map['title'] as String,
      chapters: List<String>.from(map['chapters'] as List),
      finalText: map['finalText'] as String,
    );
  }
}
