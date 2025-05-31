import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/config/theme/theme_manager.dart';
import 'package:news_app/core/routes_manager.dart';
import 'package:news_app/extensions/context_ex.dart';

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(context.widthScreen, context.heightScreen),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeManger.light,
        darkTheme: ThemeManger.dark,
        themeMode: ThemeMode.dark,
        onGenerateRoute: RoutesManager.router,
        initialRoute: RoutesManager.home,
        locale: Locale("en"),
      ),
    );
  }
}
