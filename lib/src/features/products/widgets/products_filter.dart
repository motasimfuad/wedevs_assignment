part of '../view/products_screen.dart';

class ProductsFilter extends StatelessWidget {
  const ProductsFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 6.w),
      margin: EdgeInsets.only(bottom: 10.h),
      height: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 3,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          TextButton.icon(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: AppColors.pageBackground,
                isScrollControlled: true,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8.r),
                    topLeft: Radius.circular(8.r),
                  ),
                ),
                context: context,
                builder: (builder) {
                  return const FiltersBottomSheet();
                },
              );
            },
            icon: Image.asset(
              Assets.filters,
              height: 15.h,
              color: AppColors.darkGrey,
            ),
            label: Text(
              "Filter",
              style: TextStyle(
                color: AppColors.darkGrey,
                fontSize: 15.6.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ),
          const Spacer(),
          Builder(
            builder: (context) {
              final controller = Get.find<ProductsViewController>();
              return Obx(
                () {
                  return (controller.selectedFilter.value?.title.isNotEmpty ??
                          false)
                      ? TextButton.icon(
                          iconAlignment: IconAlignment.end,
                          onPressed: null,
                          icon: Image.asset(
                            Assets.sortBy,
                            height: 8.h,
                            color: AppColors.darkGrey,
                          ),
                          label: Obx(
                            () => Text(
                              controller.selectedFilter.value?.title ??
                                  'Sort By',
                              style: TextStyle(
                                color: AppColors.darkGrey,
                                fontSize: 15.6.w,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox();
                },
              );
            },
          ),
          IconButton(
            icon: Image.asset(
              Assets.viewMode,
              height: 14.h,
              color: Colors.black87,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
