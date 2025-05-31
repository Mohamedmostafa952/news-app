import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/colors_manager.dart';

class ThemeManger {
  static final ThemeData light = ThemeData();
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black17,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.black17,
      foregroundColor: ColorsManager.white,
      centerTitle: true,
      titleTextStyle: GoogleFonts.inter(
        fontWeight: FontWeight.w500,
        fontSize: 20.sp,
      ),
    ),
    textTheme: TextTheme(
      bodyMedium: GoogleFonts.inter(
        fontSize: 24.sp,
        color: ColorsManager.white,
        fontWeight: FontWeight.w500,
      ),
      titleSmall: GoogleFonts.inter(
        fontWeight: FontWeight.bold,
        color: ColorsManager.white,
        fontSize: 16.sp
      ),
      labelSmall: GoogleFonts.inter(
          fontSize: 12.sp,
          color: ColorsManager.grey,
          fontWeight: FontWeight.w500
      ),
    ),
    tabBarTheme: TabBarTheme(
      tabAlignment: TabAlignment.start,
      indicatorColor: ColorsManager.white,
      dividerColor: Colors.transparent,
      labelStyle: GoogleFonts.inter(
        fontSize: 16.sp,
        color: ColorsManager.white,
        fontWeight: FontWeight.bold
      ),
      unselectedLabelStyle: GoogleFonts.inter(
          fontSize: 14.sp,
          color: ColorsManager.white,
          fontWeight: FontWeight.w500
      ),
    )
  );
}
