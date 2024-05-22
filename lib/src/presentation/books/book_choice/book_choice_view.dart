import 'package:flutter/material.dart';
import 'package:taalim/src/core/ui/theme/app_text_style.dart';
import 'package:taalim/src/core/ui/widgets/container_text_widget.dart';
import 'package:taalim/src/data/local/list_names.dart';
import 'package:taalim/src/data/local/list_of_view.dart';

class BookChoiceView extends StatelessWidget {
  const BookChoiceView({
    Key? key,
    this.listNames,
  }) : super(key: key);
  final ListNames? listNames;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          ListNames.bookViewNames.toString(),
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
            itemCount: ListNames.bookViewNames.length,
            itemBuilder: (context, index) {
              return ContainerTextWidget(
                width: width,
                height: height,
                text: ListNames.bookViewNames[index],
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    ListOfView.homeViewListindex[index],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
