// import 'package:flutter/material.dart';
// import 'package:taalim/src/core/ui/theme/app_colors.dart';
// import 'package:taalim/src/core/ui/theme/app_text_style.dart';
// import 'package:taalim/src/core/ui/widgets/audio/audio_player_widget.dart';
// import 'package:taalim/src/core/ui/widgets/bottom_nav_bar/bottom_nav_bar_widget.dart';
// import 'package:taalim/src/data/model/dua_model.dart';

// class DuaDetailView extends StatelessWidget {
//   final DuaModel duaModel;

//   DuaDetailView(this.duaModel);

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;
//     final height = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: AppColors.white,
//       appBar: AppBar(
//         toolbarHeight: 100,
//         centerTitle: true,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: Text(
//           duaModel.title!,
//           style: AppTextStyle.blue24Bold,
//         ),
//         backgroundColor: AppColors.white,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 13),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 decoration: BoxDecoration(
//                   color: AppColors.lightGrayWhite.withOpacity(0.05),
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 child: Row(
//                   children: [
//                     SizedBox(
//                       width: width * 0.07,
//                     ),
//                     // const Text(
//                     //   '2:126',
//                     //   style: AppTextStyle.blue18Bold,
//                     // ),
//                     const Spacer(),
//                     IconButton(
//                       icon: Image.asset('assets/icons/share.png'),
//                       onPressed: () {},
//                     ),
//                     if (duaModel.audio != null)
//                       AudioPlayerWidget(audioUrl: duaModel.audio!),
//                     IconButton(
//                       icon: Image.asset('assets/icons/bookmark.png'),
//                       onPressed: () {},
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: height * 0.06),
//               if (duaModel.arabicText != null)
//                 Text(
//                   duaModel.arabicText!,
//                   style: AppTextStyle.black20Bold,
//                   textAlign: TextAlign.center,
//                 ),
//               const Divider(),
//               SizedBox(height: height * 0.04),
//               if (duaModel.kyrgyzText != null)
//                 Text(
//                   duaModel.kyrgyzText!,
//                   style: AppTextStyle.black18W400,
//                 ),
//               SizedBox(height: height * 0.04),
//               const Divider(),
//               SizedBox(height: height * 0.04),
//               if (duaModel.transcription != null)
//                 Text(
//                   duaModel.transcription!,
//                   style: AppTextStyle.black18W400,
//                 ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: const BottomNavBarWidget(),
//     );
//   }
// }

/* fine worked
import 'package:flutter/material.dart';
import 'package:taalim/src/core/ui/theme/app_colors.dart';
import 'package:taalim/src/core/ui/theme/app_text_style.dart';
import 'package:taalim/src/core/ui/widgets/audio/audio_player_widget.dart';
import 'package:taalim/src/core/ui/widgets/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:taalim/src/core/ui/widgets/pdf/share_pdf_widget.dart';
import 'package:taalim/src/data/model/dua_model.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DuaDetailView extends StatelessWidget {
  final DuaModel duaModel;

  DuaDetailView(this.duaModel);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          duaModel.title!,
          style: AppTextStyle.blue24Bold,
        ),
        backgroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGrayWhite.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.07,
                    ),
                    const Spacer(),
                    SharePdfWidget(duaModel: duaModel),
                    if (duaModel.audio != null)
                      AudioPlayerWidget(audioUrl: duaModel.audio!),
                    IconButton(
                      icon: Image.asset('assets/icons/bookmark.png'),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.06),
              if (duaModel.arabicText != null)
                Text(
                  duaModel.arabicText!,
                  style: AppTextStyle.black20Bold,
                  textAlign: TextAlign.center,
                ),
              const Divider(),
              SizedBox(height: height * 0.04),
              if (duaModel.kyrgyzText != null)
                Text(
                  duaModel.kyrgyzText!,
                  style: AppTextStyle.black18W400,
                ),
              SizedBox(height: height * 0.04),
              const Divider(),
              SizedBox(height: height * 0.04),
              if (duaModel.transcription != null)
                Text(
                  duaModel.transcription!,
                  style: AppTextStyle.black18W400,
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:taalim/src/core/ui/theme/app_colors.dart';
import 'package:taalim/src/core/ui/theme/app_text_style.dart';
import 'package:taalim/src/core/ui/widgets/audio/audio_player_widget.dart';
import 'package:taalim/src/core/ui/widgets/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:taalim/src/core/ui/widgets/pdf/share_pdf_widget.dart';
import 'package:taalim/src/data/model/dua_model.dart';

class DuaDetailView extends StatelessWidget {
  final DuaModel duaModel;

  DuaDetailView(this.duaModel);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          duaModel.title!,
          style: AppTextStyle.blue24Bold,
        ),
        backgroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: AppColors.lightGrayWhite.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.07,
                    ),
                    const Spacer(),
                    SharePdfWidget(duaModel: duaModel),
                    if (duaModel.audio != null)
                      AudioPlayerWidget(audioUrl: duaModel.audio!),
                    BlocBuilder<FavoritesCubit, List<String>>(
                      builder: (context, favorites) {
                        final isFavorited = context
                            .read<FavoritesCubit>()
                            .isFavorite(duaModel.id);
                        return IconButton(
                          icon: Icon(
                            isFavorited
                                ? Icons.bookmark
                                : Icons.bookmark_border,
                            color: isFavorited ? Colors.red : Colors.grey,
                          ),
                          onPressed: () {
                            context
                                .read<FavoritesCubit>()
                                .toggleFavorite(duaModel.id);
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.06),
              if (duaModel.arabicText != null)
                Text(
                  duaModel.arabicText!,
                  style: AppTextStyle.black20Bold,
                  textAlign: TextAlign.center,
                ),
              const Divider(),
              SizedBox(height: height * 0.04),
              if (duaModel.kyrgyzText != null)
                Text(
                  duaModel.kyrgyzText!,
                  style: AppTextStyle.black18W400,
                ),
              SizedBox(height: height * 0.04),
              const Divider(),
              SizedBox(height: height * 0.04),
              if (duaModel.transcription != null)
                Text(
                  duaModel.transcription!,
                  style: AppTextStyle.black18W400,
                ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}

class FavoritesCubit extends Cubit<List<String>> {
  FavoritesCubit() : super([]) {
    loadFavorites();
  }

  // Load favorites from storage (SharedPreferences)
  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? favorites = prefs.getStringList('favorites') ?? [];
    emit(favorites);
  }

  // Add a favorite
  Future<void> addFavorite(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = List.from(state);
    if (!favorites.contains(id)) {
      favorites.add(id);
      await prefs.setStringList('favorites', favorites);
      emit(favorites);
    }
  }

  // Remove a favorite
  Future<void> removeFavorite(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favorites = List.from(state);
    favorites.remove(id);
    await prefs.setStringList('favorites', favorites);
    emit(favorites);
  }

  // Toggle favorite (add or remove)
  Future<void> toggleFavorite(String id) async {
    if (state.contains(id)) {
      removeFavorite(id);
    } else {
      addFavorite(id);
    }
  }

  // Check if a page is favorited
  bool isFavorite(String id) {
    return state.contains(id);
  }
}
