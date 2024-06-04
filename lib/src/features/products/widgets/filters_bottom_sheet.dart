part of '../view/products_screen.dart';

class FiltersBottomSheet extends StatelessWidget {
  const FiltersBottomSheet({
    super.key,
  });

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
                  onTap: () {},
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
