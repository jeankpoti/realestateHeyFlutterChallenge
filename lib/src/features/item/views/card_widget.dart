import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:realstate/src/constants/app_colors.dart';

import '../../../constants/app_text.styles.dart';

class CardWidget extends StatelessWidget {
  final String name, desc, size, publishDate, mainImageUrl;
  final double discount, rating, height, blurHeight, price;
  final ImageProvider? image;
  final bool isBigcard;

  const CardWidget({
    super.key,
    this.name = '',
    this.desc = '',
    this.price = 0,
    this.discount = 0,
    this.rating = 0,
    this.size = '',
    this.image,
    this.height = 220,
    this.blurHeight = 100,
    this.publishDate = '',
    this.isBigcard = false,
    this.mainImageUrl = '',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: double.infinity,
            height: height.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              image: mainImageUrl.isNotEmpty
                  ? DecorationImage(
                      image: NetworkImage(
                        mainImageUrl,
                      ),
                      fit: BoxFit.cover,
                      colorFilter: const ColorFilter.mode(
                        Colors.black54,
                        BlendMode.darken,
                      ),
                    )
                  : const DecorationImage(
                      image: AssetImage('assets/images/h.jpg'),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black54,
                        BlendMode.darken,
                      ),
                    ),
            ),
            child: !isBigcard
                ? Padding(
                    padding: EdgeInsets.only(
                        left: 16.w, top: 16.h, bottom: 16.h, right: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Let\'s buy a house',
                          style: AppTextStyles.subtitle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          'here',
                          style: AppTextStyles.subtitle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
          ),
          ClipRRect(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(15.r),
              bottomRight: Radius.circular(15.r),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
              child: Container(
                width: double.infinity,
                height: blurHeight.h,
                color: Colors.black.withOpacity(0.1),
              ),
            ),
          ),
          SizedBox(height: 8.h),
          !isBigcard
              ? Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Discount 10%',
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.bodyLg,
                      ),
                      Text(
                        '12 October 2022',
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.bodyLg,
                      )
                    ],
                  ),
                )
              : Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 100.w,
                                child: Text(
                                  name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.subtitle.copyWith(
                                    color: AppColors.bodyColor,
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              SizedBox(
                                width: 100.w,
                                child: Text(
                                  '$price/mo',
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.bodyLg,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(50.r),
                                child: Container(
                                  width: 80.w,
                                  color: AppColors.primary,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 4.w, vertical: 4.h),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const Icon(Icons.star,
                                          color: AppColors.secondary),
                                      Text(
                                        rating.toString(),
                                        overflow: TextOverflow.ellipsis,
                                        style: AppTextStyles.bodyLg.copyWith(
                                          color: AppColors.titleColor,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.h),
                              SizedBox(
                                width: 100.w,
                                child: Text(
                                  size,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.bodyLg,
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
        ],
      ),
    );
  }
}
