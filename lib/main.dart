import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/firebase_options.dart';
import 'package:taalim/src/core/navigation/app_routes.dart';
import 'package:taalim/src/core/ui/widgets/bottom_nav_bar/cubit/bottom_nav_bar_cubit.dart';
import 'package:taalim/src/presentation/books/cubit/books_cubit.dart';
import 'package:taalim/src/presentation/dua/cubit/dua_cubit.dart';
import 'package:taalim/src/presentation/dua/dua_text/cubit/dua_text_cubit.dart';
import 'package:taalim/src/presentation/dua/dua_text/dua_text_view.dart';
import 'package:taalim/src/presentation/question-answer/cubit/question_answer_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const Taalim(),
  );
}

class Taalim extends StatelessWidget {
  const Taalim({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => QuestionAnswerCubit()),
        BlocProvider(create: (context) => BooksCubit()),
        BlocProvider(create: (context) => DuaCubit()),
        BlocProvider(create: (context) => BottomNavBarCubit()),
        BlocProvider(create: (context) => DuaTextCubit()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutersFunction.onGenerateRoute,
        // home: DuaTextView(),

        // title: 'University',
        //       theme: getAppTheme(),
        //       onGenerateRoute: AppRoutersFunc.onGenerateRoute,
      ),
    );
  }
}
