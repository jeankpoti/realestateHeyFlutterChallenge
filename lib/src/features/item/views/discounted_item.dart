import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text.styles.dart';
import '../controllers/item_controller.dart';
import 'card_widget.dart';
import 'item_details_view.dart';

class DiscountedItemView extends ConsumerStatefulWidget {
  const DiscountedItemView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DiscountedItemViewState();
}

class _DiscountedItemViewState extends ConsumerState<DiscountedItemView> {
  ItemController itemController = ItemController();

  @override
  void initState() {
    ref.read(itemControllerProvider.notifier).getProperties(0);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final itemList = ref.watch(itemControllerProvider);

    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        elevation: 0,
        title: Text('Discounted Items',
            style: AppTextStyles.subtitle.copyWith(
              fontSize: 18.sp,
            )),
      ),
      body: itemList.isNotEmpty
          ? ListView.separated(
              itemCount: itemList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context, rootNavigator: true).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            ItemDetailsView(
                          mainImageUrl: itemList[0].coverPhoto?.url ?? '',
                          externalId: itemList[0].externalID ?? '',
                          rating: 4.5,
                        ),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) {
                          return FadeScaleTransition(
                            animation: animation,
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: CardWidget(
                      isBigcard: true,
                      mainImageUrl: itemList[index].coverPhoto?.url ?? '',
                      name: itemList[index].title ?? '',
                      desc: itemList[index].title ?? '',
                      price: itemList[index].price ?? 0,
                      rating: 4.5,
                      size: itemList[index].purpose ?? '',
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 12.h,
                );
              },
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
