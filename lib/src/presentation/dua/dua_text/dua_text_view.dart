import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/core/ui/theme/app_colors.dart';
import 'package:taalim/src/core/ui/theme/app_text_style.dart';
import 'package:taalim/src/core/ui/widgets/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:taalim/src/presentation/dua/dua_text/cubit/dua_text_cubit.dart';

class DuaTextView extends StatelessWidget {
  const DuaTextView({Key? key}) : super(key: key);

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
            // Handle back button press
          },
        ),
        title: const Text(
          'Курандагы дуалар',
          style: AppTextStyle.blue24Bold,
        ),
        backgroundColor: AppColors.white,
      ),
      body: BlocBuilder<DuaTextCubit, DuaTextState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.error != null) {
            return Center(child: Text('Error: ${state.error}'));
          } else if (state.duaText != null) {
            final duaText = state.duaText!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
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
                        const Text(
                          '2:126',
                          style: AppTextStyle.blue18Bold,
                        ),
                        const Spacer(),
                        IconButton(
                          icon: Image.asset('assets/icons/share.png'),
                          onPressed: () {
                            // Handle share button press
                          },
                        ),
                        IconButton(
                          icon: Image.asset(
                            state.isPlaying
                                ? 'assets/icons/play.png'
                                : 'assets/icons/play.png',
                          ),
                          onPressed: () {
                            context.read<DuaTextCubit>().togglePlayPause();
                          },
                        ),
                        IconButton(
                          icon: Image.asset('assets/icons/bookmark.png'),
                          onPressed: () {
                            // Handle bookmark button press
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.06),
                  Text(
                    duaText.arabicText,
                    style: AppTextStyle.black20Bold,
                    textAlign: TextAlign.center,
                  ),
                  const Divider(),
                  SizedBox(height: height * 0.04),
                  Text(
                    duaText.kyrgyzText,
                    style: AppTextStyle.black18W400,
                  ),
                  SizedBox(height: height * 0.04),
                  const Divider(),
                  SizedBox(height: height * 0.04),
                  Text(
                    duaText.transcriptionText,
                    style: AppTextStyle.black18W400,
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('No data found'));
          }
        },
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
