import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taalim/src/core/ui/texts/app_text.dart';
import 'package:taalim/src/core/ui/theme/app_colors.dart';
import 'package:taalim/src/core/ui/theme/app_text_style.dart';
import 'package:taalim/src/presentation/home/home_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppText.taalim,
              textAlign: TextAlign.center,
              style: AppTextStyle.blue28w700,
            ),
            SizedBox(height: height * 0.016),
            const Text(
              AppText.islamKitepter,
              textAlign: TextAlign.center,
              style: AppTextStyle.gray18w400,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            SvgPicture.asset(
              'assets/images/book.svg',
              width: width * 0.8,
              height: height * 0.6,
            ),
            SizedBox(
              height: height * 0.05,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeView(),
                  ),
                );
              },
              child: Container(
                width: width * 0.5,
                height: height * 0.08,
                decoration: ShapeDecoration(
                  color: AppColors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Center(
                  child: Text(AppText.bashtoo,
                      textAlign: TextAlign.center,
                      style: AppTextStyle.white18w400),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
