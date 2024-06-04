part of '../views/profile_screen.dart';

class ProfileSection extends StatefulWidget {
  final String title;
  final String icon;
  final List<Widget> children;

  const ProfileSection({
    Key? key,
    required this.title,
    required this.icon,
    required this.children,
  }) : super(key: key);

  @override
  State<ProfileSection> createState() => _ProfileSectionState();
}

class _ProfileSectionState extends State<ProfileSection> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(
        dividerColor: Colors.transparent,
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
      child: ExpansionTile(
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        tilePadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ),
        childrenPadding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 10.h,
        ).copyWith(bottom: 40.h),
        visualDensity: VisualDensity.compact,
        leading: Image.asset(
          widget.icon,
          height: 22.h,
          color: AppColors.grey,
        ),
        trailing: Icon(
          isExpanded
              ? Icons.chevron_right_rounded
              : Icons.keyboard_arrow_down_rounded,
          color: AppColors.grey,
          size: 24.h,
        ),
        onExpansionChanged: (value) {
          setState(() {
            isExpanded = !value;
          });
        },
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
            fontSize: 17.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: widget.children,
      ),
    );
  }
}
