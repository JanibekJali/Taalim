import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/core/enums/fetch_status.dart';
import 'package:taalim/src/core/navigation/app_routes_path.dart';
import 'package:taalim/src/core/ui/widgets/container_text_widget.dart';
import 'package:taalim/src/presentation/question-answer/cubit/question_answer_cubit.dart';

class QuestionAnswerView extends StatelessWidget {
  const QuestionAnswerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
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
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.qurtionAnswerModel!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ContainerTextWidget(
                        widgetChoice: true,
                        width: width,
                        height: height,
                        text: state.qurtionAnswerModel![index].name,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutesPath.booksChoice,
                          );
                        },
                      );
                    },
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
