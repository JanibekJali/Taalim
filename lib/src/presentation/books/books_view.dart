import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/core/enums/fetch_status.dart';
import 'package:taalim/src/core/navigation/app_routes_path.dart';
import 'package:taalim/src/core/ui/texts/app_text.dart';
import 'package:taalim/src/core/ui/theme/app_text_style.dart';
import 'package:taalim/src/core/ui/widgets/container_text_widget.dart';
import 'package:taalim/src/presentation/books/cubit/books_cubit.dart';

class BooksView extends StatelessWidget {
  const BooksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        if (state.fetchStatus == FetchStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.fetchStatus == FetchStatus.success &&
            state.bookModel != null) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              centerTitle: true,
              title: const Text(
                AppText.kitepter,
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
                  itemCount: state.bookModel!.length,
                  itemBuilder: (context, index) {
                    return ContainerTextWidget(
                      width: width,
                      height: height,
                      text: state.bookModel![index].bookName,
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutesPath.booksChoice,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text('Maalymat Jok'));
        }
      },
    );
  }
}
