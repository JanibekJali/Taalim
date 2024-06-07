import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/src/core/navigation/app_routes_path.dart';
import 'package:taalim/src/core/ui/widgets/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:taalim/src/data/local/list_of_view.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarCubit, NavBarState>(
      builder: (context, state) {
        return BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.business),
              label: 'Business',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.school),
              label: 'School',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
          ],
          currentIndex: state.selectedItem!,
          selectedItemColor: Colors.amber[800],
          onTap: (value) {
            if (value == 0) {
              Navigator.pushNamed(
                context,
                AppRoutesPath.home,
              );
            }
            if (value == 1) {
              Navigator.pushNamed(
                context,
                AppRoutesPath.dua,
              );
            }
            if (value == 2) {
              Navigator.pushNamed(
                context,
                AppRoutesPath.books,
              );
            }
            context.read<NavBarCubit>().onItemTapped(value);
          },
        );
      },
    );
  }
}
