import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/core/enums/fetch_status.dart';
import 'package:taalim/src/core/navigation/app_routes_path.dart';
import 'package:taalim/src/core/ui/texts/app_text.dart';
import 'package:taalim/src/core/ui/theme/app_text_style.dart';
import 'package:taalim/src/core/ui/widgets/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:taalim/src/core/ui/widgets/container_text_widget.dart';
import 'package:taalim/src/data/firebase/firebase_collection.dart';
import 'package:taalim/src/presentation/dua/cubit/dua_cubit.dart';

class DuaView extends StatelessWidget {
  const DuaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<DuaCubit, DuaState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            toolbarHeight: 100,
            centerTitle: true,
            title: const Text(
              AppText.dualar,
              style: AppTextStyle.blue24Bold,
              textAlign: TextAlign.center,
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
                  state.duaModel != null) {
                log('Success state');
                return Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30),
                    ),
                    GridView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: width * 0.05,
                        mainAxisExtent: height * 0.15,
                      ),
                      itemCount: state.duaModel!.length,
                      itemBuilder: (context, index) {
                        return ContainerTextWidget(
                          width: width,
                          height: height,
                          text: state.duaModel![index].dua,
                          onTap: () {
                            if (index == 0) {
                              Navigator.pushNamed(
                                  context, AppRoutesPath.duaTextView);
                            }
                            if (index == 1) {
                              Navigator.pushNamed(
                                  context, AppRoutesPath.duaSelectionView);
                            }
                            if (index == 2) {
                              Navigator.pushNamed(
                                  context, AppRoutesPath.duaSelectionView);
                            }
                            if (index == 2) {
                              Navigator.pushNamed(
                                  context, AppRoutesPath.duaSelectionView);
                            }
                            if (index == 4) {
                              Navigator.pushNamed(
                                  context, AppRoutesPath.duaSelectionView);
                            }
                            if (index == 5) {
                              Navigator.pushNamed(
                                  context, AppRoutesPath.duaSelectionView);
                            }
                            if (index == 6) {
                              Navigator.pushNamed(
                                  context, AppRoutesPath.duaSelectionView);
                            }
                            if (index == 7) {
                              context
                                  .read<DuaCubit>()
                                  .getDua(FirebaseCollection.quranicDuas);
                              Navigator.pushNamed(
                                  context, AppRoutesPath.duaSelectionView);
                            }
                          },
                        );
                      },
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
