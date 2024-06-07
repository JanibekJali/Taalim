import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/core/ui/theme/app_text_style.dart';
import 'package:taalim/src/core/ui/widgets/container_text_widget.dart';
import 'package:taalim/src/data/local/list_names.dart';
import 'package:taalim/src/data/local/list_of_view.dart';
import 'package:taalim/src/presentation/books/book_choice/cubit/book_choice_cubit.dart';
import 'package:taalim/src/presentation/books/cubit/books_cubit.dart';

class BookChoiceView extends StatelessWidget {
  const BookChoiceView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<BookChoiceCubit, BookChoiceState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            centerTitle: true,
            title: Text(
              state.bookModel![0].bookName,
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
                itemCount: ListNames.bookViewNames.length,
                itemBuilder: (context, index) {
                  return ContainerTextWidget(
                    width: width,
                    height: height,
                    text: state.bookModel![index].bookName,
                    onTap: () {
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
      },
    );
  }
}
