import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:realstate/src/features/item/views/popular_item_view.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text.styles.dart';
import '../controllers/item_controller.dart';
import 'card_widget.dart';
import 'discounted_item.dart';
import 'item_details_view.dart';
import 'search_result_view.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  ItemController itemController = ItemController();
  final TextEditingController _searchController = TextEditingController();

  bool ispriceInvalid = false;

  @override
  void initState() {
    ref.read(itemControllerProvider.notifier).getProperties(0);

    super.initState();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemList = ref.watch(itemControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'LOGO',
              style: AppTextStyles.title,
            ),
            const Icon(Icons.notifications_outlined)
          ],
        ),
      ),
      body: itemList.isNotEmpty
          ? SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 32.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50.r),
                          color: AppColors.primary,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 3,
                              spreadRadius: 1,
                              offset: const Offset(1, 1),
                              color: Colors.grey.withOpacity(
                                0.2,
                              ),
                            ),
                          ],
                        ),
                        child: TextField(
                          controller: _searchController,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            if (_searchController.text.length > 7) {
                              setState(() {
                                ispriceInvalid = true;
                              });
                            } else {
                              setState(() {
                                ispriceInvalid = false;
                              });
                            }
                          },
                          decoration: InputDecoration(
                            hintText: 'Search by minimum price',
                            hintStyle: AppTextStyles.body,
                            suffixIcon: GestureDetector(
                              onTap: () => {
                                if (_searchController.text.isNotEmpty)
                                  {
                                    Navigator.of(context, rootNavigator: true)
                                        .push(
                                      PageRouteBuilder(
                                        pageBuilder: (context, animation,
                                                secondaryAnimation) =>
                                            SearchresultItemView(
                                          query: double.parse(
                                            _searchController.text == ''
                                                ? '0'
                                                : _searchController.text,
                                          ),
                                        ),
                                        transitionsBuilder: (context, animation,
                                            secondaryAnimation, child) {
                                          return FadeScaleTransition(
                                            animation: animation,
                                            child: child,
                                          );
                                        },
                                      ),
                                    ),
                                  }
                              },
                              child: !ispriceInvalid
                                  ? const Icon(Icons.search)
                                  : const SizedBox.shrink(),
                            ),
                            suffixIconColor: AppColors.bodyColor,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.r),
                              borderSide: const BorderSide(
                                width: 1.0,
                                color: Colors.white,
                              ),
                            ),
                            // Enabled border
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(50.r),
                              borderSide: const BorderSide(
                                width: 1.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ispriceInvalid
                          ? Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: Text(
                                  'Minimum price  must be less tha 8 digits',
                                  style: AppTextStyles.body.copyWith(
                                    color: Colors.red,
                                  )),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(height: 32.h),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      const DiscountedItemView(),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeScaleTransition(
                                      animation: animation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: CardWidget(
                              height: 150.h,
                              blurHeight: 55.h,
                            ),
                          ),
                          SizedBox(height: 16.h),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      ItemDetailsView(
                                    mainImageUrl:
                                        itemList[0].coverPhoto?.url ?? '',
                                    externalId: itemList[0].externalID ?? '',
                                    rating: 4.5,
                                  ),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeScaleTransition(
                                      animation: animation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: CardWidget(
                              isBigcard: true,
                              mainImageUrl: itemList[0].coverPhoto?.url ?? '',
                              name: itemList[0].title ?? '',
                              desc: itemList[0].title ?? '',
                              price: itemList[0].price ?? 0,
                              rating: 4.5,
                              size: itemList[0].purpose ?? '',
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Popular today',
                                  style: AppTextStyles.subtitle,
                                ),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.of(context,
                                                rootNavigator: true)
                                            .push(
                                          PageRouteBuilder(
                                            pageBuilder: (context, animation,
                                                    secondaryAnimation) =>
                                                const PopularItemView(),
                                            transitionsBuilder: (context,
                                                animation,
                                                secondaryAnimation,
                                                child) {
                                              return FadeScaleTransition(
                                                animation: animation,
                                                child: child,
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: Text(
                                        'Other',
                                        style: AppTextStyles.body.copyWith(
                                          color: AppColors.accent,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    const Icon(
                                      Icons.keyboard_arrow_down_outlined,
                                      color: AppColors.accent,
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.h),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context, rootNavigator: true).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation,
                                          secondaryAnimation) =>
                                      ItemDetailsView(
                                    mainImageUrl:
                                        itemList[0].coverPhoto?.url ?? '',
                                    externalId: itemList[0].externalID ?? '',
                                    rating: 4.5,
                                  ),
                                  transitionsBuilder: (context, animation,
                                      secondaryAnimation, child) {
                                    return FadeScaleTransition(
                                      animation: animation,
                                      child: child,
                                    );
                                  },
                                ),
                              );
                            },
                            child: CardWidget(
                              isBigcard: true,
                              mainImageUrl: itemList[0].coverPhoto?.url ?? '',
                              name: itemList[0].title ?? '',
                              desc: itemList[0].title ?? '',
                              price: itemList[0].price ?? 0,
                              rating: 4.5,
                              size: itemList[0].purpose ?? '',
                            ),
                          ),
                          SizedBox(height: 16.h),
                        ],
                      ),
                    ]),
              ),
            )
          : Center(
              child: LoadingAnimationWidget.inkDrop(
                color: AppColors.accent,
                size: 50,
              ),
            ),
    );
  }
}
