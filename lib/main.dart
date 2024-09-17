import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taalim/firebase_options.dart';
import 'package:taalim/src/core/navigation/app_routes.dart';
import 'package:taalim/src/core/ui/bloc/share/cubit/floating_action_botton_cubit.dart';
import 'package:taalim/src/core/ui/widgets/bottom_nav_bar/cubit/bottom_nav_bar_cubit.dart';
import 'package:taalim/src/data/repositories/dua_repo.dart';
import 'package:taalim/src/presentation/books/cubit/books_cubit.dart';
import 'package:taalim/src/presentation/dua/cubit/dua_cubit.dart';
import 'package:taalim/src/presentation/dua/dua_detail/dua_detail_view.dart';
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
        BlocProvider(create: (context) => DuaCubit(DuaRepo())..getDua()),
        // BlocProvider(create: (context) => DuaCubit(DuaRepo())..getDuaSelection()),
        BlocProvider(create: (context) => BottomNavBarCubit()),
        // BlocProvider(create: (context) => DuaTextCubit()),
        BlocProvider(create: (context) => FloatingActionBottonCubit()),
        BlocProvider(create: (context) => FavoritesCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutersFunction.onGenerateRoute,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          pageTransitionsTheme: PageTransitionsTheme(builders: {
            TargetPlatform.iOS: NoAnimationTransitionBuilder(),
            TargetPlatform.android: NoAnimationTransitionBuilder(),
            // Add other platforms if needed
          }),
        ),

        // title: 'University',
        //       theme: getAppTheme(),
        //       onGenerateRoute: AppRoutersFunc.onGenerateRoute,
      ),
    );
  }
}

class NoAnimationTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return child; // No animation
  }
}
  //// don't call !!!
// void createFirestoreStructure() async {
//   FirebaseFirestore firestore = FirebaseFirestore.instance;

//   // 1. Create the main kitepter1 documents
//   await firestore.collection('kitepter1').doc('fikh').set({'title': 'Фикх'});
//   log('Created document: kitepter1/fikh');
//   await firestore.collection('kitepter1').doc('hadis').set({'title': 'Хадис'});
//   log('Created document: kitepter1/hadis');
//   await firestore.collection('kitepter1').doc('siro').set({'title': 'Сиро'});
//   log('Created document: kitepter1/siro');

//   // 2. Create kitepter1 choices for 'fikh'
//   List<String> fikhChoices = ['muhtasar1', 'muhtasar2', 'usul_muhtasar'];
//   for (String choice in fikhChoices) {
//     await firestore
//         .collection('kitepter1')
//         .doc('fikh')
//         .collection('kitepter1_choice')
//         .doc(choice)
//         .set({'title': choice});
//     log('Created document: kitepter1/fikh/kitepter1_choice/$choice');

//     // 3. Create kitepter1 sections for each choice in 'fikh'
//     List<String> fikhSections = [
//       'kirish_soz',
//       'daarat',
//       'namaz',
//       'orozo',
//       'zeket',
//       'ajylyk'
//     ];
//     for (String section in fikhSections) {
//       await firestore
//           .collection('kitepter1')
//           .doc('fikh')
//           .collection('kitepter1_choice')
//           .doc(choice)
//           .collection('kitepter1_section')
//           .doc(section)
//           .set({'title': section});
//       log('Created document: kitepter1/fikh/kitepter1_choice/$choice/kitepter1_section/$section');

//       // 4. Create kitepter1 section choices for each section in 'fikh'
//       List<String> daaratChoices = [
//         'daarattyn_sunnottoru',
//         'daarattyn_parzdary',
//         'guzul_tuuraluu_bolum'
//       ];
//       for (String sectionChoice in daaratChoices) {
//         await firestore
//             .collection('kitepter1')
//             .doc('fikh')
//             .collection('kitepter1_choice')
//             .doc(choice)
//             .collection('kitepter1_section')
//             .doc(section)
//             .collection('kitepter1_section_choice')
//             .doc(sectionChoice)
//             .set({'title': sectionChoice});
//         log('Created document: kitepter1/fikh/kitepter1_choice/$choice/kitepter1_section/$section/kitepter1_section_choice/$sectionChoice');

//         // 5. Create kitepter1 section choice sections for each section choice in 'fikh'
//         List<String> sectionChoiceSections = [
//           'juzdu_chachtan_bashtap_juu',
//           'koldu_chykanak_menen_kosho_juu',
//           'buttu_tomuk_menen_kosho_juu'
//         ];
//         for (String choiceSection in sectionChoiceSections) {
//           await firestore
//               .collection('kitepter1')
//               .doc('fikh')
//               .collection('kitepter1_choice')
//               .doc(choice)
//               .collection('kitepter1_section')
//               .doc(section)
//               .collection('kitepter1_section_choice')
//               .doc(sectionChoice)
//               .collection('kitepter1_section_choice_section')
//               .doc(choiceSection)
//               .set({
//             'title': choiceSection,
//             'content': 'Your text content here...'
//           });
//           log('Created document: kitepter1/fikh/kitepter1_choice/$choice/kitepter1_section/$section/kitepter1_section_choice/$sectionChoice/kitepter1_section_choice_section/$choiceSection');
//         }
//       }
//     }
//   }

//   // Repeat the same structure for 'hadis'
//   List<String> hadisChoices = ['tandalgan_hadister', 'hadis1'];
//   for (String choice in hadisChoices) {
//     await firestore
//         .collection('kitepter1')
//         .doc('hadis')
//         .collection('kitepter1_choice')
//         .doc(choice)
//         .set({'title': choice});
//     log('Created document: kitepter1/hadis/kitepter1_choice/$choice');

//     List<String> hadisSections = ['section1', 'section2'];
//     for (String section in hadisSections) {
//       await firestore
//           .collection('kitepter1')
//           .doc('hadis')
//           .collection('kitepter1_choice')
//           .doc(choice)
//           .collection('kitepter1_section')
//           .doc(section)
//           .set({'title': section});
//       log('Created document: kitepter1/hadis/kitepter1_choice/$choice/kitepter1_section/$section');

//       List<String> sectionChoices = ['choice1', 'choice2'];
//       for (String sectionChoice in sectionChoices) {
//         await firestore
//             .collection('kitepter1')
//             .doc('hadis')
//             .collection('kitepter1_choice')
//             .doc(choice)
//             .collection('kitepter1_section')
//             .doc(section)
//             .collection('kitepter1_section_choice')
//             .doc(sectionChoice)
//             .set({'title': sectionChoice});
//         log('Created document: kitepter1/hadis/kitepter1_choice/$choice/kitepter1_section/$section/kitepter1_section_choice/$sectionChoice');

//         List<String> choiceSections = ['subchoice1', 'subchoice2'];
//         for (String choiceSection in choiceSections) {
//           await firestore
//               .collection('kitepter1')
//               .doc('hadis')
//               .collection('kitepter1_choice')
//               .doc(choice)
//               .collection('kitepter1_section')
//               .doc(section)
//               .collection('kitepter1_section_choice')
//               .doc(sectionChoice)
//               .collection('kitepter1_section_choice_section')
//               .doc(choiceSection)
//               .set({
//             'title': choiceSection,
//             'content': 'Your text content here...'
//           });
//           log('Created document: kitepter1/hadis/kitepter1_choice/$choice/kitepter1_section/$section/kitepter1_section_choice/$sectionChoice/kitepter1_section_choice_section/$choiceSection');
//         }
//       }
//     }
//   }

//   // Repeat the same structure for 'siro'
//   List<String> siroChoices = ['choice1', 'choice2'];
//   for (String choice in siroChoices) {
//     await firestore
//         .collection('kitepter1')
//         .doc('siro')
//         .collection('kitepter1_choice')
//         .doc(choice)
//         .set({'title': choice});
//     log('Created document: kitepter1/siro/kitepter1_choice/$choice');

//     List<String> siroSections = ['section1', 'section2'];
//     for (String section in siroSections) {
//       await firestore
//           .collection('kitepter1')
//           .doc('siro')
//           .collection('kitepter1_choice')
//           .doc(choice)
//           .collection('kitepter1_section')
//           .doc(section)
//           .set({'title': section});
//       log('Created document: kitepter1/siro/kitepter1_choice/$choice/kitepter1_section/$section');

//       List<String> sectionChoices = ['choice1', 'choice2'];
//       for (String sectionChoice in sectionChoices) {
//         await firestore
//             .collection('kitepter1')
//             .doc('siro')
//             .collection('kitepter1_choice')
//             .doc(choice)
//             .collection('kitepter1_section')
//             .doc(section)
//             .collection('kitepter1_section_choice')
//             .doc(sectionChoice)
//             .set({'title': sectionChoice});
//         log('Created document: kitepter1/siro/kitepter1_choice/$choice/kitepter1_section/$section/kitepter1_section_choice/$sectionChoice');

//         List<String> choiceSections = ['subchoice1', 'subchoice2'];
//         for (String choiceSection in choiceSections) {
//           await firestore
//               .collection('kitepter1')
//               .doc('siro')
//               .collection('kitepter1_choice')
//               .doc(choice)
//               .collection('kitepter1_section')
//               .doc(section)
//               .collection('kitepter1_section_choice')
//               .doc(sectionChoice)
//               .collection('kitepter1_section_choice_section')
//               .doc(choiceSection)
//               .set({
//             'title': choiceSection,
//             'content': 'Your text content here...'
//           });
//           log('Created document: kitepter1/siro/kitepter1_choice/$choice/kitepter1_section/$section/kitepter1_section_choice/$sectionChoice/kitepter1_section_choice_section/$choiceSection');
//         }
//       }
//     }
//   }
// }
