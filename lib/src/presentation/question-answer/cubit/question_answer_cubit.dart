import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:taalim/src/core/enums/fetch_status.dart';
import 'package:taalim/src/core/exception/server_exception.dart';
import 'package:taalim/src/data/firebase/firebase_data.dart';
import 'package:taalim/src/data/model/question_answer_model.dart';

part 'question_answer_state.dart';

class QuestionAnswerCubit extends Cubit<QuestionAnswerState> {
  QuestionAnswerCubit() : super(QuestionAnswerState());

  Future getQuestionAnswer() async {
    try {
      emit(state.copyWith(fetchStatus: FetchStatus.loading));
      final response = await FirebaseData.getQuestionAnswerDataFromFirebase();
      if (response != null) {
        emit(
          state.copyWith(
              fetchStatus: FetchStatus.success, qurtionAnswerModel: response),
        );
      } else {
        emit(
          state.copyWith(fetchStatus: FetchStatus.error),
        );
      }
    } catch (e) {
      throw ServerException('$e');
    }
  }
}
