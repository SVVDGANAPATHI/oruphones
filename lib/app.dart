import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:oruphones/config/routes/routes.dart';
import 'package:oruphones/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'ORUPHONES',
          theme: AppTheme.lightTheme,
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRoutes.onGenerateRoutes,
          //home: SplashScreen(),
        );
      },
    );
  }
}
