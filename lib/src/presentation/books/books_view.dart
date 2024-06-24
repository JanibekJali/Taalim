import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/core/enums/fetch_status.dart';
import 'package:taalim/src/core/navigation/app_routes_path.dart';
import 'package:taalim/src/core/ui/texts/app_text.dart';
import 'package:taalim/src/core/ui/theme/app_colors.dart';
import 'package:taalim/src/core/ui/theme/app_text_style.dart';
import 'package:taalim/src/core/ui/widgets/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:taalim/src/core/ui/widgets/container_text_widget.dart';
import 'package:taalim/src/data/firebase/firebase_collection.dart';
import 'package:taalim/src/presentation/books/cubit/books_cubit.dart';

class BooksView extends StatelessWidget {
  const BooksView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            centerTitle: true,
            title: const Text(
              AppText.kitepter,
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
              if (state.status == FetchStatus.loading) {
                log('Loading state');
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state.status == FetchStatus.success &&
                  state.bookModel != null) {
                log('Success state');
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                    ),
                    Expanded(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemExtent: height * 0.1,
                        itemCount: state.bookModel!.length,
                        itemBuilder: (context, index) {
                          return ContainerTextWidget(
                            width: width,
                            height: height,
                            text: state.bookModel![index].title,
                            onTap: () {
                              if (index == 0) {
                                context
                                    .read<BooksCubit>()
                                    .getBookData(FirebaseCollection.muhtasar);
                              }
                              if (index == 1) {
                                context
                                    .read<BooksCubit>()
                                    .getBookData(FirebaseCollection.hadis);
                              }
                              if (index == 2) {
                                context
                                    .read<BooksCubit>()
                                    .getBookData(FirebaseCollection.siro);
                              }
                              Navigator.pushNamed(
                                context,
                                AppRoutesPath.booksChoice,
                                arguments: state.bookModel![index],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                );
              } else {
                log('Error state or no books');
                return const Center(child: Text('Maalymat Jok'));
              }
            }(),
          ),
          bottomNavigationBar: const BottomNavBarWidget(),
        );
      },
    );
  }
}
