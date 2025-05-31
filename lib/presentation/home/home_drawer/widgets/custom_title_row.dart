import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/colors_manager.dart';

class CustomTitleRow extends StatelessWidget {
  const CustomTitleRow({super.key, required this.icon, required this.title});

  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: ColorsManager.white),
        SizedBox(width: 4.w),
        Text(
          title,
          style: GoogleFonts.inter(
            color: ColorsManager.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.sp,
          ),
        ),
      ],
    );
  }
}
