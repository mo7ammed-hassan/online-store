import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:online_store/core/configs/theme/app_theme.dart';
import 'package:online_store/features/splash/presentation/pages/splash_page.dart';
import 'package:online_store/firebase_options.dart';
import 'package:online_store/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  initializeDependencies();
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Online Store',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const SplashPage(),
    );
  }
}
