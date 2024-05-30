import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/firebase_options.dart';
import 'package:taalim/src/core/navigation/app_routes.dart';
import 'package:taalim/src/presentation/books/cubit/books_cubit.dart';
import 'package:taalim/src/presentation/names-of-allah/Cubit/SaveCubit/SaveCubit.dart';
import 'package:taalim/src/presentation/names-of-allah/Cubit/SubCubit/SubCubit.dart';

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
          BlocProvider<SubCubit>(
          create: (context) => SubCubit(),
        ),
        BlocProvider<SaveCubit>(
          create: (context) => SaveCubit(),
        ),
      ],
      child: const 
      MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutersFunction.onGenerateRoute,

        // title: 'University',
        //       theme: getAppTheme(),
        //       onGenerateRoute: AppRoutersFunc.onGenerateRoute,
      ),
    );
  }
}
