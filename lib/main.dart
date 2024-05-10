import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:taalim/firebase_options.dart';
import 'package:taalim/src/presentation/welcome/welcome_view.dart';

void main()async {
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
    return MaterialApp(home:WelcomeView() ,);
  }
}