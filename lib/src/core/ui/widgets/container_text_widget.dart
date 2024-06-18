import 'package:flutter/material.dart';
import 'package:taalim/src/core/ui/theme/app_colors.dart';
import 'package:taalim/src/core/ui/theme/app_text_style.dart';

class ContainerTextWidget extends StatelessWidget {
  const ContainerTextWidget({
    super.key,
    required this.onTap,
    required this.width,
    required this.height,
    required this.text,
    this.color,
  });

  final double width;
  final double height;
  final Color? color;
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: InkWell(
        customBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        splashColor: AppColors.gray,
        onTap: onTap,
        child: Ink(
          decoration: BoxDecoration(
            color: color ?? AppColors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                color: Color(0x264A545C),
                blurRadius: 8,
                offset: Offset(0, 2),
              )
            ],
          ),
          child: SizedBox(
            width: width * 0.8,
            height: height * 0.09,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                child: FittedBox(
                  child: Text(
                    text,
                    style: AppTextStyle.blue18Bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
