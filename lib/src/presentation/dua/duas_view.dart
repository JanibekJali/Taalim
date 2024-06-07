import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/core/enums/fetch_status.dart';
import 'package:taalim/src/core/navigation/app_routes_path.dart';
import 'package:taalim/src/core/ui/texts/app_text.dart';
import 'package:taalim/src/core/ui/theme/app_text_style.dart';
import 'package:taalim/src/core/ui/widgets/container_text_widget.dart';
import 'package:taalim/src/core/ui/widgets/nav_bar/bottom_nav_bar.dart';
import 'package:taalim/src/presentation/dua/cubit/dua_cubit.dart';

class DuasView extends StatelessWidget {
  const DuasView({Key? key}) : super(key: key);

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
              title: const Text(
                AppText.dualar,
                style: AppTextStyle.blue24Bold,
                textAlign: TextAlign.center,
              ),
            ),
            body: Column(
              children: [
                GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: width * 0.05,
                    mainAxisExtent: height * 0.15,
                  ),
                  shrinkWrap: true,
                  itemCount: state.duaModel!.length,
                  itemBuilder: (context, index) {
                    return ContainerTextWidget(
                      width: width,
                      height: height,
                      text: state.duaModel![index].dua,
                      onTap: () {
                        // Navigator.pushNamed(
                        //   context,
                        //   AppRoutesPath.booksChoice,
                        // );
                      },
                    );
                  },
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
