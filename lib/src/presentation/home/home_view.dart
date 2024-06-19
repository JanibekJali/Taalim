import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/core/ui/texts/app_text.dart';
import 'package:taalim/src/core/ui/theme/app_text_style.dart';
import 'package:taalim/src/core/ui/widgets/container_text_widget.dart';
import 'package:taalim/src/data/local/list_names.dart';
import 'package:taalim/src/data/local/list_of_view.dart';
import 'package:taalim/src/presentation/books/cubit/books_cubit.dart';
import 'package:taalim/src/presentation/dua/cubit/dua_cubit.dart';
import 'package:taalim/src/presentation/question-answer/cubit/question_answer_cubit.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text(
          AppText.taalim,
          style: AppTextStyle.blue24Bold,
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemExtent: height * 0.1,
            itemCount: ListNames.homeViewNames.length,
            itemBuilder: (context, index) {
              return ContainerTextWidget(
                width: width,
                height: height,
                text: ListNames.homeViewNames[index],
                onTap: () {
                  if (index == 0) {
                    context.read<BooksCubit>().getBookData();
                  }
                  if (index == 1) {
                    context.read<DuaCubit>().getDua();
                  }
                  if (index == 2) {
                    context.read<QuestionAnswerCubit>().getQuestionAnswer();
                  }
                  Navigator.pushNamed(
                    context,
                    ListViewRoutes.homeViewRoutes[index],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
