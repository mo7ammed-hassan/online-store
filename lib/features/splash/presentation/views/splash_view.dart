import 'package:flutter/material.dart';
import 'package:online_store/common/helper/navigation.dart';
import 'package:online_store/core/configs/assets/app_images.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/features/auth/presentation/views/signin.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? fadeAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    fadeAnimation = Tween<double>(
      begin: 0.1,
      end: 1.0,
    ).animate(animationController!);

    animationController!.forward();
    redirect();
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: AnimatedBuilder(
          animation: fadeAnimation!,
          builder: (context, _) {
            return Opacity(
              opacity: fadeAnimation?.value,
              child: Image.asset(AppImages.appLogo),
            );
          },
        ),
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 4));
    context.pushReplacement(
      const SigninView(),
    );
  }
}
