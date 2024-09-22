import 'package:flutter/material.dart';
import 'package:test_riverpod/common/constant/app_colors.dart';
import 'package:test_riverpod/common/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        sliderTheme: const SliderThemeData(
          trackHeight: 1,
          thumbColor: AppColors.black,
          activeTrackColor: AppColors.black,
          inactiveTrackColor: AppColors.black,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 16),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(13),
            backgroundColor: AppColors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
      ),
      routerConfig: _appRouter.config(),
    );
  }
}
