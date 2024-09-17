import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/core/navigation/app_routes_path.dart';
import 'package:taalim/src/core/ui/theme/app_colors.dart';
import 'package:taalim/src/core/ui/theme/app_text_style.dart';
import 'package:taalim/src/core/ui/widgets/bottom_nav_bar/bottom_nav_bar_widget.dart';
import 'package:taalim/src/core/ui/widgets/container_text_widget.dart';
import 'package:taalim/src/data/repositories/dua_repo.dart';
import 'package:taalim/src/presentation/dua/cubit/dua_cubit.dart';

class DuaSelectionView extends StatelessWidget {
  final String parentKey;
  final String title;
  const DuaSelectionView({
    required this.parentKey,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        toolbarHeight: 100,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            // context.read<DuaCubit>().getDua(FirebaseCollection.dualar);
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          title,
          style: AppTextStyle.blue24Bold,
          textAlign: TextAlign.center,
        ),
      ),
      body: BlocProvider(
        create: (context) => DuaCubit(DuaRepo())..getDuaSelection(parentKey),
        child: BlocBuilder<DuaCubit, DuaState>(
          builder: (context, state) {
            if (state is DuaLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DuaLoaded) {
              return Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 30),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemExtent: height * 0.1,
                      itemCount: state.duaIndex.length,
                      itemBuilder: (context, index) {
                        final duaList = state.duaIndex[index];
                        return ContainerTextWidget(
                          color: AppColors.blue,
                          width: width,
                          height: height,
                          text: duaList.title!,
                          textStyle: AppTextStyle.white18Bold,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutesPath.duaDetailView,
                              arguments: duaList,
                            );
                            // if (index == 0) {
                            //   context.read<DuaTextCubit>().fetchDuaText();
                            // }
                            // Navigator.pushNamed(
                            //   context,
                            //   AppRoutesPath.duaTextView,
                            // );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            } else if (state is DuaError) {
              return Center(child: Text(state.error));
            } else {
              return Container();
            }
          },
        ),
      ),
      bottomNavigationBar: const BottomNavBarWidget(),
    );
  }
}
