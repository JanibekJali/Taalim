part of 'question_answer_cubit.dart';

class QuestionAnswerState extends Equatable {
  const QuestionAnswerState({
    this.fetchStatus = FetchStatus.loading,
    this.qurtionAnswerModel,
  });
  final FetchStatus fetchStatus;
  final List<QuestionAnswerModel>? qurtionAnswerModel;
  @override
  List<Object?> get props => [fetchStatus, qurtionAnswerModel];
  QuestionAnswerState copyWith({
    FetchStatus? fetchStatus,
    List<QuestionAnswerModel>? qurtionAnswerModel,
  }) {
    return QuestionAnswerState(
      fetchStatus: fetchStatus ?? this.fetchStatus,
      qurtionAnswerModel: qurtionAnswerModel ?? this.qurtionAnswerModel,
    );
  }
}
