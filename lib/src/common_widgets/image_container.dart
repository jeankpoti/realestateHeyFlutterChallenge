import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/src/constants/app_colors.dart';

class ImageContainer extends StatelessWidget {
  final bool isSelected;
  final String imageUrl;
  const ImageContainer({
    super.key,
    this.isSelected = false,
    this.imageUrl = '',
  });

  @override
  Widget build(BuildContext context) {
    print('imageUrl $imageUrl');
    return Container(
      height: 80.h,
      width: 80.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: AppColors.primary,
        image: imageUrl.isNotEmpty
            ? DecorationImage(
                image: NetworkImage(
                  imageUrl,
                ),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  isSelected ? Colors.white : Colors.black54,
                  BlendMode.darken,
                ),
              )
            : DecorationImage(
                image: const AssetImage('assets/images/h2.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  isSelected ? Colors.white : Colors.black54,
                  BlendMode.darken,
                ),
              ),
      ),
    );
  }
}
