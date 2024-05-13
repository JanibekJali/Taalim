// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:taalim/src/core/navigation/app_routes_path.dart';

// class AppRoutersFunc {
//   static Route<void> onGenerateRoute(RouteSettings settings) {
//     switch (settings.name) {
//       case AppRoutesPath.auth:
//         return CupertinoPageRoute(
//           builder: (_) {
//             return const AuthPage();
//           },
//           settings: settings,
//         );
//       case AppRoutesPath.main:
//         return CupertinoPageRoute(
//           builder: (_) {
//             return BlocProvider(
//               create: (BuildContext context) => MainCubit(),
//               child: const MainPage(),
//             );
//           },
//           settings: settings,
//         );
//       case AppRoutesPath.home:
//         return CupertinoPageRoute(
//           builder: (_) {
//             return const HomePage();
//           },
//           settings: settings,
//         );
//       case AppRoutesPath.homeUniversity:
//         return CupertinoPageRoute(
//           builder: (_) {
//             return BlocProvider(
//               create: (BuildContext context) => MainCubit(),
//               child: const HomeUniversityPage(),
//             );
//           },
//           settings: settings,
//         );
//       case AppRoutesPath.homeCollege:
//         return CupertinoPageRoute(
//           builder: (_) {
//             return const HomeCollegePage();
//           },
//           settings: settings,
//         );
//       case AppRoutesPath.collegeAbroad:
//         return CupertinoPageRoute(
//           builder: (_) {
//             return const CollageAbroadPage();
//           },
//           settings: settings,
//         );
//       case AppRoutesPath.profession:
//         return CupertinoPageRoute(
//           builder: (_) {
//             return const ProfessionPage();
//           },
//           settings: settings,
//         );
//       case AppRoutesPath.university:
//         return CupertinoPageRoute(
//           builder: (_) {
//             return const UniversityPage();
//           },
//           settings: settings,
//         );
//       case AppRoutesPath.collage:
//         return CupertinoPageRoute(
//           builder: (_) {
//             return const CollagePage();
//           },
//           settings: settings,
//         );
//       case AppRoutesPath.universityRegion:
//         return CupertinoPageRoute(
//           builder: (_) {
//             return const UniverstyRegionPage();
//           },
//         );
//       case AppRoutesPath.collageRegion:
//         return CupertinoPageRoute(
//           builder: (_) {
//             return const CollageRegionPage();
//           },
//         );
//       case AppRoutesPath.universityAbroad:
//         return CupertinoPageRoute(
//           builder: (_) {
//             return const UniverstyAbroadPage();
//           },
//           settings: settings,
//         );
//       case AppRoutesPath.settings:
//         return CupertinoPageRoute(
//           builder: (_) {
//             return const SettingsPage();
//           },
//           settings: settings,
//         );
//       case AppRoutesPath.contact:
//         return CupertinoPageRoute(
//           builder: (_) {
//             return const ContactPage();
//           },
//           settings: settings,
//         );
//       case AppRoutesPath.aboutUs:
//         return CupertinoPageRoute(
//           builder: (_) {
//             return const AboutUsPage();
//           },
//           settings: settings,
//         );
//       default:
//         throw Exception(
//           'no builder specified for route named: [${settings.name}]',
//         );
//     }
//   }
// }
