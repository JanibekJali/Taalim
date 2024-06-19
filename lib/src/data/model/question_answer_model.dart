class QuestionAnswerModel {
  final String name;

  QuestionAnswerModel({
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory QuestionAnswerModel.fromMap(Map<String, dynamic> map) {
    return QuestionAnswerModel(
      name: map['name'] as String,
    );
  }
}
