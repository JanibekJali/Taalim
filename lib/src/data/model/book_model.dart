// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

class BookModelToo {
  final String bookName;
  final List<SubBookModel>? subBooks;

  BookModelToo({
    required this.bookName,
    this.subBooks,
  });

  Map<String, dynamic> toMap() {
    return {
      'bookName': bookName,
      'subBooks': subBooks?.map((x) => x.toMap()).toList(),
    };
  }

  factory BookModelToo.fromMap(Map<String, dynamic> map) {
    return BookModelToo(
      bookName: map['bookName'] as String,
      subBooks: map['subBook'] != null
          ? List<SubBookModel>.from(
              (map['subBook'] as List).map<SubBookModel>(
                (x) => SubBookModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
}

class SubBookModel {
  final String subBook;
  final List<SubSubBookModel>? subSubBooks;

  SubBookModel({required this.subBook, this.subSubBooks});

  Map<String, dynamic> toMap() {
    return {
      'subBook': subBook,
      'subMuhtasar': subSubBooks?.map((x) => x.toMap()).toList(),
    };
  }

  factory SubBookModel.fromMap(Map<String, dynamic> map) {
    return SubBookModel(
      subBook: map['subBook'] as String,
      subSubBooks: map['subMuhtasar'] != null
          ? List<SubSubBookModel>.from(
              (map['subMuhtasar'] as List).map<SubSubBookModel>(
                (x) => SubSubBookModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
}

class SubSubBookModel {
  final String subSubBook;
  final List<SubSubSubBookModel>? subSubSubBooks;

  SubSubBookModel({required this.subSubBook, this.subSubSubBooks});

  Map<String, dynamic> toMap() {
    return {
      'subMuhtasar': subSubBook,
      'bookSelect': subSubSubBooks?.map((x) => x.toMap()).toList(),
    };
  }

  factory SubSubBookModel.fromMap(Map<String, dynamic> map) {
    return SubSubBookModel(
      subSubBook: map['subMuhtasar'] as String,
      subSubSubBooks: map['bookSelect'] != null
          ? List<SubSubSubBookModel>.from(
              (map['bookSelect'] as List).map<SubSubSubBookModel>(
                (x) => SubSubSubBookModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
}

class SubSubSubBookModel {
  final String subSubSubBook;
  final List<SubSubSubSubBookModel>? subSubSubSubBooks;

  SubSubSubBookModel({required this.subSubSubBook, this.subSubSubSubBooks});

  Map<String, dynamic> toMap() {
    return {
      'bookSelect': subSubSubBook,
      'bookSelectChoise': subSubSubSubBooks?.map((x) => x.toMap()).toList(),
    };
  }

  factory SubSubSubBookModel.fromMap(Map<String, dynamic> map) {
    return SubSubSubBookModel(
      subSubSubBook: map['bookSelect'] as String,
      subSubSubSubBooks: map['bookSelectChoise'] != null
          ? List<SubSubSubSubBookModel>.from(
              (map['bookSelectChoise'] as List).map<SubSubSubSubBookModel>(
                (x) => SubSubSubSubBookModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
}

class SubSubSubSubBookModel {
  final String subSubSubSubBook;
  final List<OverSubCollections>? overBook;

  SubSubSubSubBookModel({required this.subSubSubSubBook, this.overBook});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bookSelectChoise': subSubSubSubBook,
      'overBook': overBook?.map((x) => x.toMap()).toList(),
    };
  }

  factory SubSubSubSubBookModel.fromMap(Map<String, dynamic> map) {
    return SubSubSubSubBookModel(
      subSubSubSubBook: map['bookSelectChoise'] as String,
      overBook: map['overBook'] != null
          ? List<OverSubCollections>.from(
              (map['overBook'] as List).map<OverSubCollections>(
                (x) => OverSubCollections.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }
}

class OverSubCollections {
  final String overBook;

  OverSubCollections({required this.overBook});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'overBook': overBook,
    };
  }

  factory OverSubCollections.fromMap(Map<String, dynamic> map) {
    return OverSubCollections(
      overBook: map['overBook'] as String,
    );
  }
}
