import 'dart:ui';
import 'package:art_work/main_screen.dart';
import 'package:art_work/injection_container.dart';
import 'package:flutter/material.dart';
import 'features/auth/presentation/widgets/auth_widgets.dart';
import 'features/home/presentation/exercise.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  await EasyLocalization.ensureInitialized();
  await initializeDependencies();
  runApp(
    EasyLocalization(
      path: 'assets/lang',
      saveLocale: true,
      startLocale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider<ExerciseProvider>(
            create: (context) => ExerciseProvider(sl()),
          ),
          ChangeNotifierProvider<AuthenticationProvider>(
            create: (context) => AuthenticationProvider(
                sl(), sl(), sl()), // Initialize OtherProvider here
          ),
          // Add more providers as needed
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SplashScreen(),
    );
  }
}
