/// packages
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/core.dart';
import '../../../auth/presentation/widgets/auth_widgets.dart';
/// imports
import '../../domain/entities/exercise.dart';
import '../exercise.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  String? token = "";

  @override
  void initState() {
    super.initState();
    // Call fetchExercises from ExerciseProvider's instance
    final exerciseProvider = Provider.of<ExerciseProvider>(context, listen: false);
    exerciseProvider.fetchExercises();
    // getCurrentUer
    Provider.of<AuthenticationProvider>(context, listen: false).getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    final List<ExerciseEntity> exercises = Provider.of<ExerciseProvider>(context).exercises;
    final authProvider = Provider.of<AuthenticationProvider>(context);

    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(),
      body: CommonBackground(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UserWelcomeWidget(user: authProvider.user),
                      PopupMenuButton(
                        child: Stack(
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: const ShapeDecoration(
                                shape: OvalBorder(),
                              ),
                              child: Image.asset(
                                'assets/userPhoto.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ],
                        ),
                        itemBuilder: (ctx) => [
                          PopupMenuItem(
                            child: MenuButtonWelcome(userName: authProvider.user!.email ,),
                          ),PopupMenuItem(
                            child: const Text("انحليزي"),onTap: () =>
                              setState(() {context.setLocale(const Locale('en'));}),
                          ),
                          PopupMenuItem(
                              child: const Text("عربي"),onTap: () =>
                              setState(() {context.setLocale(const Locale('ar'));})
                          ),
                        ],
                      ),
                    ],
                  ),
                  const CarouselSliderImage(),
                  /// Popular Exercise Section
                  SectionTitle(
                    title: 'popular_exercise'.tr(),
                  ),
                  PopularExercise(exercises: exercises,),
                  SectionTitle(
                    title: "todays_course".tr(),
                  ),
                  const TodayCourse(),
                  TextButton(onPressed: () => authProvider.logOut(), child: Text("sign_out".tr())),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

