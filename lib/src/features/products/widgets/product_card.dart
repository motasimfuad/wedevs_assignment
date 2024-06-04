import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:motasimfuad_wedevs/src/core/theme/colors.dart';
import 'package:motasimfuad_wedevs/src/features/products/controllers/products_view_controller.dart';
import 'package:motasimfuad_wedevs/src/features/products/models/product_model.dart';
import 'package:motasimfuad_wedevs/src/utils/app_constants.dart';
import 'package:motasimfuad_wedevs/src/utils/assets.dart';
import 'package:motasimfuad_wedevs/src/utils/enums.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
  });
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      shadowColor: Colors.black.withOpacity(0.2),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: CachedNetworkImage(
                imageUrl: (product.images?.isNotEmpty ?? false)
                    ? product.images![0].src ?? AppConstants.noImagePlaceholder
                    : AppConstants.noImagePlaceholder,
                cacheKey:
                    product.images![0].src ?? AppConstants.noImagePlaceholder,
                fit: BoxFit.contain,
                width: double.infinity,
                alignment: Alignment.center,
                errorWidget: (context, url, error) {
                  return Image.network(
                    AppConstants.noImagePlaceholder,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                },
                placeholder: (context, url) => const Center(
                  child: CupertinoActivityIndicator(),
                ),
              ),
            ),
            Divider(
              height: 0,
              color: AppColors.grey.withOpacity(0.1),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10.h,
                  horizontal: 12.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      product.name ?? '',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: [
                        if (product.regularPrice?.isNotEmpty ?? false)
                          Container(
                            margin: EdgeInsets.only(right: 4.w),
                            child: Text(
                              "\$${product.regularPrice}",
                              style: TextStyle(
                                color: AppColors.grey,
                                decoration: TextDecoration.lineThrough,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        Text(
                          "\$${product.price}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Obx(
                      () {
                        final controller = Get.find<ProductsViewController>();
                        return (controller.selectedFilter.value ==
                                ProductFilters.bestSelling)
                            ? Text(
                                "${product.totalSales ?? 0} Sold",
                                style: TextStyle(
                                  color: AppColors.darkGrey,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.normal,
                                ),
                              )
                            : RatingBarIndicator(
                                direction: Axis.horizontal,
                                rating: product.ratingCount!.toDouble(),
                                itemCount: 5,
                                itemSize: 10.h,
                                itemPadding: EdgeInsets.only(
                                  right: 2.w,
                                ),
                                itemBuilder: (context, _) {
                                  return Image.asset(
                                    Assets.star,
                                    color: AppColors.yellow,
                                  );
                                },
                              );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
