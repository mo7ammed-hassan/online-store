import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_store/common/helper/app_navigator.dart';
import 'package:online_store/core/configs/assets/app_images.dart';
import 'package:online_store/core/configs/theme/app_colors.dart';
import 'package:online_store/features/auth/presentation/pages/signin_page.dart';
import 'package:online_store/features/home/presentation/pages/home_page.dart';
import 'package:online_store/features/splash/presentation/cubits/splash_cubit.dart';
import 'package:online_store/features/splash/presentation/cubits/splash_state.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
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
    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state is UnAuthenticated) {
          context.pushReplacement(const SigninPage());
        }
        if (state is Authenticated) {
          context.pushReplacement(const HomePage());
        }
      },
      child: Scaffold(
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
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 4));
    context.pushReplacement(
      const SigninPage(),
    );
  }
}
