import 'package:flutter/cupertino.dart';
import 'package:taalim/src/core/navigation/app_routes_path.dart';
import 'package:taalim/src/presentation/books/book_choice/book_choice_view.dart';
import 'package:taalim/src/presentation/books/book_section/book_section_view.dart';
import 'package:taalim/src/presentation/books/books_view.dart';
import 'package:taalim/src/presentation/dua/dua_selection/dua_selection_view.dart';
import 'package:taalim/src/presentation/dua/dua_text/dua_text_view.dart';
import 'package:taalim/src/presentation/dua/duas_view.dart';
import 'package:taalim/src/presentation/home/home_view.dart';
import 'package:taalim/src/presentation/names-of-allah/names_of_allah_view.dart';
import 'package:taalim/src/presentation/question-answer/question_answer_view.dart';
import 'package:taalim/src/presentation/welcome/welcome_view.dart';

class AppRoutersFunction {
  static Route<void> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutesPath.main:
        return CupertinoPageRoute(
          builder: (_) => const WelcomeView(),
          settings: settings,
        );
      case AppRoutesPath.home:
        return CupertinoPageRoute(
          builder: (_) => const HomeView(),
          settings: settings,
        );
      case AppRoutesPath.books:
        final booksArgs = settings.arguments as Map<String, String>;
        return CupertinoPageRoute(
          builder: (_) => BooksView(title: booksArgs['title']!),
          settings: settings,
        );
      case AppRoutesPath.booksChoice:
        final booksChoiceArgs = settings.arguments as Map<String, String>;
        return CupertinoPageRoute(
          builder: (_) => BookChoiceView(
              bookId: booksChoiceArgs['bookId']!,
              title: booksChoiceArgs['title']!),
          settings: settings,
        );
      case AppRoutesPath.bookSection:
        final booksSectionArgs = settings.arguments as Map<String, String>;
        return CupertinoPageRoute(
          builder: (_) => BookSectionView(
              bookId: booksSectionArgs['bookId']!,
              bookChoiceId: booksSectionArgs['bookChoiceId']!,
              title: booksSectionArgs['title']!),
          settings: settings,
        );

      // case AppRoutesPath.bookText:
      //   final bookTextArgs = settings.arguments as Map<String, String>;
      //   return CupertinoPageRoute(
      //     builder: (_) => BookTextView(
      //         bookId: bookTextArgs['bookId']!,
      //         bookChoiceId: bookTextArgs['bookChoiceId']!,
      //         bookSectionId: bookTextArgs['bookSectionId']!,
      //         bookSectionChoiceId: bookTextArgs['bookSectionChoiceId']!,
      //         bookSectionChoiceSectionId:
      //             bookTextArgs['bookSectionChoiceSectionId']!,
      //         title: bookTextArgs['title']!),
      //     settings: settings,
      //   );

      case AppRoutesPath.dua:
        return CupertinoPageRoute(
          builder: (_) {
            return const DuaView();
          },
          settings: settings,
        );
      case AppRoutesPath.duaSelectionView:
        return CupertinoPageRoute(
          builder: (_) {
            return const DuaSelectionView();
          },
          settings: settings,
        );
      case AppRoutesPath.duaTextView:
        return CupertinoPageRoute(
          builder: (_) {
            return const DuaTextView();
          },
          settings: settings,
        );
      case AppRoutesPath.questionAnswer:
        return CupertinoPageRoute(
          builder: (_) {
            return const QuestionAnswerView();
          },
          settings: settings,
        );
      case AppRoutesPath.namesOfAllah:
        return CupertinoPageRoute(
          builder: (_) {
            return const NamesOfAllahView();
          },
          settings: settings,
        );
      // case AppRoutesPath.booksValume:
      //   return CupertinoPageRoute(
      //     builder: (_) {
      //       return const BookValumeView();
      //     },
      //     settings: settings,
      //   );
      // case AppRoutesPath.bookSection:
      //   return CupertinoPageRoute(
      //     builder: (_) {
      //       return const BookSectionView();
      //     },
      //     settings: settings,
      //   );
      // case AppRoutesPath.bookSectionChoice:
      //   return CupertinoPageRoute(
      //     builder: (_) {
      //       return const BookSectionChoiceView();
      //     },
      //     settings: settings,
      //   );

      // case AppRoutesPath.bookSectionChoiceSection:
      //   return CupertinoPageRoute(
      //     builder: (_) {
      //       return const BookSectionChoiceSectionView();
      //     },
      //     settings: settings,
      //   );
      // case AppRoutesPath.bookText:
      //   return CupertinoPageRoute(
      //     builder: (_) {
      //       return const BookTextView();
      //     },
      //     settings: settings,
      //   );
      default:
        throw Exception(
          'no builder specified for route named: [${settings.name}]',
        );
    }
  }
}
