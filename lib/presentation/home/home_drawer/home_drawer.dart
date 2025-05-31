import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/colors_manager.dart';
import 'package:news_app/extensions/context_ex.dart';
import 'package:news_app/presentation/home/home_drawer/widgets/custom_title_row.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key, required this.goToHome});
  final void Function() goToHome;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: context.widthScreen * 0.7,
      backgroundColor: ColorsManager.black17,
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            color: ColorsManager.white,
            height: 166.h,
            width: double.infinity,
            child: Text(
              "News-App",
              style: GoogleFonts.inter(
                fontSize: 24.sp,
                color: ColorsManager.black17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                InkWell(
                    onTap:(){
                      goToHome();
                      Navigator.pop(context);
                    },
                    child: CustomTitleRow(icon: Icons.home, title: "Go to home")),
                SizedBox(height: 18.h,),
                Divider(color: ColorsManager.white),
                SizedBox(height: 18.h,),
                CustomTitleRow(icon: Icons.format_paint, title: "Theme"),
                SizedBox(height: 18.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Dark",
                      style: GoogleFonts.inter(
                        color: ColorsManager.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                    Switch(value: true, onChanged: (value){})
                  ],
                ),
                SizedBox(height: 18.h,),
                CustomTitleRow(icon: Icons.public, title: "Language"),
                SizedBox(height: 18.h,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "English",
                      style: GoogleFonts.inter(
                        color: ColorsManager.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                      ),
                    ),
                    Switch(value: true, onChanged: (value){})
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
