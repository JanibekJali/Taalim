import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taalim/src/core/navigation/app_routes_path.dart';
import 'package:taalim/src/core/ui/theme/app_colors.dart';
import 'package:taalim/src/core/ui/widgets/bottom_nav_bar/cubit/bottom_nav_bar_cubit.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return BottomNavigationBar(
          backgroundColor: AppColors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.blue,
          unselectedItemColor: AppColors.grayIcon,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: state.index, // Используем индекс из состояния
          onTap: (index) {
            context.read<BottomNavBarCubit>().onItemTapped(index);
            // Выполняем навигацию в зависимости от выбранного индекса
            if (index == 0) {
              Navigator.pushNamed(context, AppRoutesPath.home);
            } else if (index == 1) {
              Navigator.pushNamed(context, AppRoutesPath.books);
            } else if (index == 2) {
              Navigator.pushNamed(context, AppRoutesPath.dua);
            }
          },
          items: [
            BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                'assets/images/home.svg',
                color: state.index == 0 ? AppColors.blue : AppColors.grayIcon,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                'assets/images/icon.svg',
                color: state.index == 1 ? AppColors.blue : AppColors.grayIcon,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                'assets/images/icons.svg',
                color: state.index == 2 ? AppColors.blue : AppColors.grayIcon,
              ),
            ),
            BottomNavigationBarItem(
              label: '',
              icon: SvgPicture.asset(
                'assets/images/vector.svg',
                color: state.index == 3 ? AppColors.blue : AppColors.grayIcon,
              ),
            ),
          ],
        );
      },
    );
  }
}
