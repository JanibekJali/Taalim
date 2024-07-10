import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/core/navigation/app_routes_path.dart';
import 'package:taalim/src/core/ui/theme/app_text_style.dart';
import 'package:taalim/src/core/ui/widgets/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:taalim/src/core/ui/widgets/container_text_widget.dart';
import 'package:taalim/src/presentation/books/cubit/books_cubit.dart';

class BookSectionView extends StatelessWidget {
  final String bookId;
  final String bookChoiceId;
  final String title;
  const BookSectionView({
    Key? key,
    required this.bookId,
    required this.bookChoiceId,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<BooksCubit>().fetchNestedCollection(
        'book/$bookId/book_choice/$bookChoiceId/book_section');
    // final BookModel book =
    //     ModalRoute.of(context)!.settings.arguments as BookModel;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            centerTitle: true,
            title: Text(
              title,
              style: AppTextStyle.blue24Bold,
              textAlign: TextAlign.center,
            ),
            leading: IconButton(
              onPressed: () {
                // context
                //     .read<BooksCubit>()
                //     .getBookData(FirebaseCollection.books);
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          ),
          body: Container(
            child: () {
              if (state is BookLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is NestedCollectionLoaded) {
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemExtent: height * 0.1,
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          final item = state.items[index];
                          return ContainerTextWidget(
                            width: width,
                            height: height,
                            text: item.title,
                            onTap: () {
                              // if (index == 0) {
                              //   context
                              //       .read<BooksCubit>()
                              //       .getBookData(FirebaseCollection.muhtasar);
                              // }
                              // if (index == 1) {
                              //   context
                              //       .read<BooksCubit>()
                              //       .getBookData(FirebaseCollection.hadis);
                              // }
                              Navigator.pushNamed(
                                  context, AppRoutesPath.bookSectionChoice,
                                  arguments: {
                                    'bookId': bookId,
                                    'bookChoiceId': bookChoiceId,
                                    'bookSectionId': item.id,
                                    'title': item.title,
                                  });
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else if (state is BookError) {
                return Center(child: Text('Error: ${state.error}'));
              }
              return Center(
                child: Container(
                  child: Text('No Data'),
                ),
              );
            }(),
          ),
          bottomNavigationBar: const BottomNavBarWidget(),
        );
      },
    );
  }
}
