import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:taalim/src/core/ui/bloc/share/cubit/floating_action_botton_cubit.dart';
import 'package:taalim/src/presentation/books/cubit/books_cubit.dart';

class BookTextView extends StatelessWidget {
  final String bookId;
  final String bookChoiceId;
  final String bookSectionId;
  final String bookSectionChoiceId;
  final String bookSectionChoiceSectionId;
  final String title;

  BookTextView({
    required this.bookId,
    required this.bookChoiceId,
    required this.bookSectionId,
    required this.bookSectionChoiceId,
    required this.bookSectionChoiceSectionId,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final bookCubit = BlocProvider.of<BooksCubit>(context);
    final fabCubit = BlocProvider.of<FloatingActionBottonCubit>(context);
    final path =
        'book/$bookId/book_choice/$bookChoiceId/book_section/$bookSectionId/book_section_choice/$bookSectionChoiceId/book_section_choice_section/$bookSectionChoiceSectionId';

    bookCubit.fetchDocument(path);

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: BlocBuilder<BooksCubit, BooksState>(
        builder: (context, state) {
          if (state is BookLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is DocumentLoaded) {
            final item = state.item;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(item.title,
                  //     style:
                  //         TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),

                  Center(
                    child: Text(item.content ?? ''),
                  ), // Displaying the content if available
                ],
              ),
            );
          } else if (state is BookError) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return Container();
        },
      ),
      floatingActionButton: _buildFABMenu(context, fabCubit),
    );
  }

  Widget _buildFABMenu(BuildContext context,
      FloatingActionBottonCubit floatingActionBottonCubit) {
    return BlocBuilder<FloatingActionBottonCubit, FloatingActionBottonState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomRight,
          children: [
            if (state is FloatingActionBottonStateOpened) ...[
              Positioned(
                bottom: 90.0,
                right: 40.0,
                child: CircleAvatar(
                  radius: 28.0,
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: Icon(Icons.share, color: Colors.white),
                    onPressed: () {
                      final state = BlocProvider.of<BooksCubit>(context).state;
                      if (state is DocumentLoaded) {
                        final item = state.item;
                        final textToShare =
                            '${item.title}\n\n${item.content ?? ''}';
                        Share.share(textToShare);
                      }
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 40.0,
                right: 90.0,
                child: CircleAvatar(
                  radius: 28.0,
                  backgroundColor: Colors.blue,
                  child: IconButton(
                    icon: Icon(Icons.bookmark_border, color: Colors.white),
                    onPressed: () {
                      // Implement bookmark functionality
                    },
                  ),
                ),
              ),
            ],
            Positioned(
              bottom: 16.0,
              right: 16.0,
              child: CircleAvatar(
                radius: 28.0,
                backgroundColor: Colors.blue,
                child: IconButton(
                  icon: Icon(
                      state is FloatingActionBottonStateOpened
                          ? Icons.close
                          : Icons.more_horiz,
                      color: Colors.white),
                  onPressed: () => floatingActionBottonCubit.toggle(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
