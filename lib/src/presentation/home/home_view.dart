import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taalim/src/core/navigation/app_routes_path.dart';
import 'package:taalim/src/core/ui/texts/app_text.dart';
import 'package:taalim/src/core/ui/theme/app_colors.dart';
import 'package:taalim/src/core/ui/theme/app_text_style.dart';
import 'package:taalim/src/core/ui/widgets/container_text_widget.dart';
import 'package:taalim/src/data/local/list_names.dart';
import 'package:taalim/src/data/local/list_of_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text(
          AppText.taalim,
          style: AppTextStyle.blue24Bold,
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemExtent: height * 0.1,
            itemCount: ListNames.homeViewNames.length,
            itemBuilder: (context, index) {
              return ContainerTextWidget(
                width: width,
                height: height,
                text: ListNames.homeViewNames[index],
                onTap: () {
                  Navigator.pushNamed(
                      context, ListOfView.homeViewListindex[index]);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
