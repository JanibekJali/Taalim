import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/core/navigation/app_routes_path.dart';
import 'package:taalim/src/core/ui/widgets/bottom_nav_bar/cubit/bottom_nav_bar_cubit.dart';
import 'package:taalim/src/data/firebase/firebase_collection.dart';
import 'package:taalim/src/presentation/books/cubit/books_cubit.dart';
import 'package:taalim/src/presentation/dua/cubit/dua_cubit.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarCubit, BottomNavBarState>(
      builder: (context, state) {
        return BottomNavigationBar(
          currentIndex: state.selectedIndex!,
          selectedItemColor: Colors.red,
          // unselectedItemColor: AppColors.grayIcon,
          onTap: (value) {
            if (value == 0) {
              Navigator.pushNamed(context, AppRoutesPath.home);
            }
            if (value == 1) {
              Navigator.pushNamed(context, AppRoutesPath.books);
              context.read<BooksCubit>().getData(FirebaseCollection.books);
            }
            if (value == 2) {
              Navigator.pushNamed(context, AppRoutesPath.dua);
              context.read<DuaCubit>().getDua();
            }
            // if(value == 3){
            //   Navigator.pushNamed(context, AppRoutesPath.dua);
            // }
            context.read<BottomNavBarCubit>().onItemTapped(value);
          },
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/homeIcon.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/bookIcon.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/duaIcon.png'),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/icons/favoriteIcon.png'),
              label: '',
            ),
          ],
        );
      },
    );
  }
}
