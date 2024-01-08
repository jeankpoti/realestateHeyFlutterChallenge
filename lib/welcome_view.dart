import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'main_view.dart';
import 'src/constants/app_colors.dart';
import 'src/constants/app_text.styles.dart';
import 'src/features/item/views/home_view.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text(
          'LOGO',
          style: AppTextStyles.title,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 32.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            RichText(
              text: TextSpan(
                text: 'Looking',
                style: TextStyle(
                  color: AppColors.accent,
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: ' for an',
                    style: TextStyle(
                      color: AppColors.secondary,
                      fontSize: 32.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Text('elegant house this is the place', style: AppTextStyles.title),
            SizedBox(height: 16.h),
            Text(
              'Welcome friends, are you looking for us?',
              style: AppTextStyles.bodyLg,
            ),
            SizedBox(height: 8.h),
            Text(
              'Congratulations you have found us',
              style: AppTextStyles.bodyLg,
            ),
            SizedBox(height: 32.h),
            SizedBox(
              width: 130.w,
              height: 35.h,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const MainView(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        return FadeThroughTransition(
                          animation: animation,
                          secondaryAnimation: secondaryAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: AppColors.accent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Next',
                      style: AppTextStyles.buttonText,
                    ),
                    const Icon(
                      Icons.arrow_forward,
                      color: AppColors.primary,
                    ), // This is the icon
                  ],
                ),
              ),
            ),
            Image.asset(
              'assets/images/home_img.png',
              fit: BoxFit.fitHeight,
              height: 400.h,
            )
          ]),
        ),
      ),
    );
  }
}
