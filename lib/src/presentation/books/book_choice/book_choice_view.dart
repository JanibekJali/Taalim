// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:taalim/src/core/ui/theme/app_text_style.dart';
// import 'package:taalim/src/core/ui/widgets/container_text_widget.dart';
// import 'package:taalim/src/data/local/list_names.dart';
// import 'package:taalim/src/data/model/book_model.dart';
// import 'package:taalim/src/presentation/books/cubit/books_cubit.dart';

// class BookChoiceView extends StatelessWidget {
//   const BookChoiceView({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final BookModel book =
//         ModalRoute.of(context)!.settings.arguments as BookModel;
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;
//     return BlocBuilder<BooksCubit, BooksState>(
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             toolbarHeight: 100,
//             centerTitle: true,
//             title: Text(
//               book.title,
//               style: AppTextStyle.blue24Bold,
//               textAlign: TextAlign.center,
//             ),
//           ),
//           body: Column(
//             children: [
//               const Padding(
//                 padding: EdgeInsets.only(top: 30),
//               ),
//               ListView.builder(
//                 shrinkWrap: true,
//                 itemExtent: height * 0.1,
//                 itemCount: ListNames.bookViewNames.length,
//                 itemBuilder: (context, index) {
//                   return ContainerTextWidget(
//                     width: width,
//                     height: height,
//                     text: state.bookModel![index].title,
//                     onTap: () {
//                       // Navigator.pushNamed(
//                       //   context,
//                       //   ListViewRoutes.homeViewRoutes[index],
//                       // );
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/core/ui/theme/app_text_style.dart';
import 'package:taalim/src/core/ui/widgets/container_text_widget.dart';
import 'package:taalim/src/data/model/book_model.dart';
import 'package:taalim/src/presentation/books/cubit/books_cubit.dart';

class BookChoiceView extends StatefulWidget {
  BookChoiceView({
    Key? key,
  }) : super(key: key);

  @override
  State<BookChoiceView> createState() => _BookChoiceViewState();
}

class _BookChoiceViewState extends State<BookChoiceView> {
  final List<String> subcollectionNames = [
    'subcollection1'
    // Add other subcollection names as needed
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final BookModel book =
        ModalRoute.of(context)!.settings.arguments as BookModel;
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    // Trigger the data fetching for the subcollections
    context
        .read<BooksCubit>()
        .getSubcollectionData('books/${book.title}', 'subcollection1');

    return BlocBuilder<BooksCubit, BooksState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            centerTitle: true,
            title: Text(
              book.title,
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
                  itemExtent: height * 0.1,
                  itemCount: state.bookModel?.length ?? 0,
                  itemBuilder: (context, index) {
                    final subBook = state.bookModel![index];
                    return ContainerTextWidget(
                      width: width,
                      height: height,
                      text: subBook.title,
                      onTap: () {
                        // Handle navigation or other actions
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
