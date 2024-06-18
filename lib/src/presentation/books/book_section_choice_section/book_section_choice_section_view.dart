import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/core/enums/fetch_status.dart';
import 'package:taalim/src/core/ui/texts/app_text.dart';
import 'package:taalim/src/core/ui/theme/app_text_style.dart';
import 'package:taalim/src/core/ui/widgets/container_text_widget.dart';
import 'package:taalim/src/data/local/list_names.dart';
import 'package:taalim/src/presentation/books/cubit/books_cubit.dart';

class BookSectionsChoiseSelectView extends StatelessWidget {
  const BookSectionsChoiseSelectView({
    super.key,
    this.listNames,
  });

  final ListNames? listNames;

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
                AppText.fikh,
                style: AppTextStyle.blue24Bold,
                textAlign: TextAlign.center,
              ),
            ),
            body: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.bookModel!.length,
                    itemBuilder: (context, index) {
                      final book = state.bookModel![index];
                      return Column(
                        children: [
                          if (book.subBooks != null)
                            ...book.subBooks!.map((subBook) {
                              return Column(
                                children: [
                                  if (subBook.subSubBooks != null)
                                    ...subBook.subSubBooks!.map(
                                      (subSubBook) {
                                        return Column(
                                          children: [
                                            if (subSubBook.subSubSubBooks !=
                                                null)
                                              ...subSubBook.subSubSubBooks!.map(
                                                (subsubsubBookd) {
                                                  return Column(
                                                    children: [
                                                      if (subsubsubBookd
                                                              .subSubSubSubBooks !=
                                                          null)
                                                        ...subsubsubBookd
                                                            .subSubSubSubBooks!
                                                            .map(
                                                          (subSubSubSubBook) {
                                                            return Column(
                                                              children: [
                                                                if (subSubSubSubBook
                                                                        .overBook !=
                                                                    null)
                                                                  ...subSubSubSubBook
                                                                      .overBook!
                                                                      .map(
                                                                    (subSubSubSubSubBook) {
                                                                      return Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            top:
                                                                                10.0),
                                                                        child:
                                                                            ContainerTextWidget(
                                                                          width:
                                                                              width,
                                                                          height:
                                                                              height,
                                                                          text:
                                                                              subSubSubSubSubBook.overBook,
                                                                          onTap:
                                                                              () {},
                                                                        ),
                                                                      );
                                                                    },
                                                                  ),
                                                              ],
                                                            );
                                                          },
                                                        ),
                                                    ],
                                                  );
                                                },
                                              ),
                                          ],
                                        );
                                      },
                                    ),
                                ],
                              );
                            }),
                        ],
                      );
                    },
                  ),
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
