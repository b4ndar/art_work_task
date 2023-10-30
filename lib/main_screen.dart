import 'package:flutter/material.dart';

import 'features/auth/data/auth_data.dart';
import 'features/auth/presentation/widgets/auth_widgets.dart';
import 'features/home/presentation/exercise.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
      return StreamBuilder(stream: AuthenticationRepositoryImpl().authStateChange, builder: (context,snapshot) {
        return snapshot.hasData ? const HomeScreen() : const LoginScreen();
      });
  }
}
