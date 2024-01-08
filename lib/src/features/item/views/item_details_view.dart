import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:realstate/src/constants/app_text.styles.dart';

import '../../../common_widgets/image_container.dart';
import '../../../constants/app_colors.dart';
import '../controllers/item_controller.dart';
import '../controllers/item_details_controller.dart';

class ItemDetailsView extends ConsumerStatefulWidget {
  final String externalId, mainImageUrl;
  final double rating;

  const ItemDetailsView({
    super.key,
    this.rating = 0,
    this.externalId = '',
    this.mainImageUrl = '',
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ItemDetailsViewState();
}

class _ItemDetailsViewState extends ConsumerState<ItemDetailsView> {
  bool _isExpanded = false;
  String _mainImageUrl = '';
  int _selectedIndex = 0;

  @override
  void initState() {
    _mainImageUrl = widget.mainImageUrl;

    ref
        .read(itemDetailsControllerProvider.notifier)
        .getPropertyDetails(widget.externalId);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final itemList = ref.watch(itemControllerProvider);

    String name = itemList[0].title ?? '';
    String description = itemList[0].description ?? '';
    String mainImageUrl = itemList[0].coverPhoto?.url ?? '';
    double price = itemList[0].price ?? 0;

    print('ListItem $description');

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                mainImageUrl.isNotEmpty
                    ? Image.network(
                        _mainImageUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 500.h,
                      )
                    : Image.asset(
                        'assets/images/h.jpg',
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 500.h,
                      ),
                Positioned(
                  top: 70.h,
                  left: 20.w,
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50.r),
                        color: AppColors.primary,
                      ),
                      child: const Icon(Icons.arrow_back),
                    ),
                  ),
                ),
                Positioned(
                    bottom: 30.h,
                    right: 20,
                    child: Column(
                      children: List.generate(
                        itemList[0].photos?.take(3).length ?? 0,
                        (index) => Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.h),
                          child: GestureDetector(
                            onTap: () => setState(() {
                              _selectedIndex =
                                  index; // Update the selected index
                              _mainImageUrl = itemList[0]
                                      .photos
                                      ?.take(3)
                                      .toList()[index]
                                      .url ??
                                  '';
                            }),
                            child: ImageContainer(
                              isSelected: _selectedIndex ==
                                  index, // Use the selected index to determine whether this ImageContainer is selected
                              imageUrl: itemList[0]
                                      .photos
                                      ?.take(3)
                                      .toList()[index]
                                      .url ??
                                  '',
                            ),
                          ),
                        ),
                      ),
                    )),
              ],
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.all(16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: List.generate(
                      5,
                      (index) =>
                          const Icon(Icons.star, color: AppColors.secondary),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    name,
                    style: AppTextStyles.subtitle,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Description',
                    style: AppTextStyles.bodyLg.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(height: 10.h),
                  description.isNotEmpty
                      ? Text(
                          _isExpanded
                              ? description
                              : description.substring(0, 200),
                          style: AppTextStyles.body,
                        )
                      : const SizedBox.shrink(),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: Text(_isExpanded ? 'Show less' : 'Read more'),
                  ),
                  SizedBox(
                    height: 300.h,
                    child: const GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(37.42796133580664, -122.085749655962),
                        zoom: 14.4746,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(16.h),
        child: SizedBox(
          height: 60.h,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Price',
                      style: AppTextStyles.body.copyWith(
                          color: AppColors.titleColor,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      width: 180.w,
                      child: Text(
                        '\$ ${price.toString()}',
                        style: AppTextStyles.subtitle,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 40.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    color: AppColors.accent,
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Pay now',
                      style: AppTextStyles.body.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
