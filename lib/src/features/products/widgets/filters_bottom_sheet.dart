part of '../view/products_screen.dart';

class FiltersBottomSheet extends StatefulWidget {
  const FiltersBottomSheet({
    super.key,
  });

  @override
  State<FiltersBottomSheet> createState() => _FiltersBottomSheetState();
}

class _FiltersBottomSheetState extends State<FiltersBottomSheet> {
  final productsController = Get.find<ProductsViewController>();
  ProductFilters? isSelected;

  @override
  void initState() {
    isSelected = productsController.selectedFilter.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25.w),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.start,
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.only(bottom: 20.h),
              height: 4.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: AppColors.lightPink,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
          Text(
            "Filter",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20.h),

          /// Filters
          ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.only(
              top: 10.h,
              bottom: 20.h,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: ProductFilters.values.length,
            itemBuilder: (BuildContext context, int index) {
              final filter = ProductFilters.values[index];

              return ListTileTheme(
                horizontalTitleGap: 5.w,
                child: CheckboxListTile(
                  value: filter == isSelected,
                  side: BorderSide(
                    color: AppColors.pink,
                    width: 1.5.w,
                  ),
                  controlAffinity: ListTileControlAffinity.leading,
                  title: Text(
                    filter.title,
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  activeColor: AppColors.pink,
                  checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.r),
                  ),
                  dense: true,
                  splashRadius: 0,
                  visualDensity: VisualDensity.compact,
                  contentPadding: EdgeInsets.zero,
                  onChanged: (value) {
                    setState(() {
                      isSelected = filter;
                    });
                  },
                ),
              );
            },
          ),
          Row(
            children: [
              Expanded(
                child: PrimaryButton(
                  onTap: () => Get.back(),
                  title: "Cancel",
                  textColor: AppColors.grey,
                  backgroundColor: Colors.white,
                  height: 61.h,
                ),
              ),
              SizedBox(width: 20.w),
              Expanded(
                child: PrimaryButton(
                  onTap: () {
                    Get.back();
                    productsController.selectedFilter.value = isSelected;
                    productsController.filterProducts();
                  },
                  title: "Apply",
                  backgroundColor: AppColors.success,
                  height: 61.h,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
