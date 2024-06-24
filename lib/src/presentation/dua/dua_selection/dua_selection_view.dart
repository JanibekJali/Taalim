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
import 'package:taalim/src/presentation/dua/cubit/dua_cubit.dart';

class DuaSelectionView extends StatelessWidget {
  const DuaSelectionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return BlocBuilder<DuaCubit, DuaState>(
      builder: (context, state) {
        if (state.status == FetchStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state.status == FetchStatus.success &&
            state.duaModel != null) {
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 100,
              centerTitle: true,
              leading: IconButton(
                onPressed: () {
                  context.read<DuaCubit>().getDua(FirebaseCollection.dualar);
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back_ios),
              ),
              title: const Text(
                AppText.dualar,
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
                    itemExtent: height * 0.1,
                    itemCount: state.duaModel!.length,
                    itemBuilder: (context, index) {
                      return ContainerTextWidget(
                        color: AppColors.blue,
                        width: width,
                        height: height,
                        text: state.duaModel![index].dua,
                        textStyle: AppTextStyle.white18Bold,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRoutesPath.booksChoice,
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
            bottomNavigationBar: const BottomNavBarWidget(),
          );
        } else {
          return const Center(child: Text('Maalymat Jok'));
        }
      },
    );
  }
}
