import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/core/enums/fetch_status.dart';
import 'package:taalim/src/presentation/question-answer/cubit/question_answer_cubit.dart';

class QuestionAnswerView extends StatelessWidget {
  const QuestionAnswerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<QuestionAnswerCubit, QuestionAnswerState>(
      builder: (context, state) {
        if (state.fetchStatus == FetchStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.fetchStatus == FetchStatus.success &&
            state.qurtionAnswerModel != null) {
          return Scaffold(
              appBar: AppBar(
                title: Text('Suroo Joop'),
              ),
              body: Column(
                children: [
                  // Padding(padding: EdgeInsets.only(top: 30)),
                  SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: ListView.builder(
                      itemCount: state.qurtionAnswerModel!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Container(
                          child: Row(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.blue),
                              ),
                              Text(state.qurtionAnswerModel![index].name)
                            ],
                          ),
                          width: double.infinity,
                          height: 30,
                          color: Colors.blue,
                        );
                      },
                    ),
                  )
                ],
              ));
        } else {
          return Text(" Maalymat jok");
        }
      },
    );
  }
}
