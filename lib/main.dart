import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/firebase_options.dart';
import 'package:taalim/src/core/navigation/app_routes.dart';
import 'package:taalim/src/core/ui/widgets/nav_bar/cubit/nav_bar_cubit.dart';
import 'package:taalim/src/presentation/books/book_choice/cubit/book_choice_cubit.dart';
import 'package:taalim/src/presentation/books/cubit/books_cubit.dart';
import 'package:taalim/src/presentation/dua/cubit/dua_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const Taalim());
}

class Taalim extends StatelessWidget {
  const Taalim({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BooksCubit()),
        BlocProvider(create: (context) => BookChoiceCubit()),
        BlocProvider(create: (context) => DuaCubit()),
        BlocProvider(create: (context) => NavBarCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutersFunction.onGenerateRoute,

        // title: 'University',
        //       theme: getAppTheme(),
        //       onGenerateRoute: AppRoutersFunc.onGenerateRoute,
      ),
    );
  }
}
