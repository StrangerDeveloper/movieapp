import 'package:flutter/material.dart';
import 'package:movieapp/core/app_export.dart';

class CustomBottomBar extends StatefulWidget {
  CustomBottomBar(
      {this.onChanged, required this.selectedIndex, required this.onTap});
  final int selectedIndex;
  final Function(BottomBarEnum)? onChanged;
  final ValueChanged<int>? onTap;

  @override
  CustomBottomBarState createState() => CustomBottomBarState();
}

class CustomBottomBarState extends State<CustomBottomBar> {
  //int selectedIndex = 0;
  List<BottomMenuModel> bottomMenuList = [
    BottomMenuModel(
      icon: ImageConstant.imgNavDashboard,
      activeIcon: ImageConstant.imgNavDashboard,
      title: "Dashboard",
      type: BottomBarEnum.Dashboard,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavWatch,
      activeIcon: ImageConstant.imgNavWatch,
      title: "Watch",
      type: BottomBarEnum.Watch,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavMediaLibrary,
      activeIcon: ImageConstant.imgNavMediaLibrary,
      title: "Media Library",
      type: BottomBarEnum.Medialibrary,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgNavMore,
      activeIcon: ImageConstant.imgNavMore,
      title: "More",
      type: BottomBarEnum.More,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75.v,
      decoration: BoxDecoration(
        color: appTheme.blueGray900,
        borderRadius: BorderRadius.circular(
          27.h,
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedFontSize: 0,
        elevation: 0,
        currentIndex: widget.selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: List.generate(bottomMenuList.length, (index) {
          return BottomNavigationBarItem(
            icon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].icon,
                  height: 18.adaptSize,
                  width: 18.adaptSize,
                  color: appTheme.whiteA700,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5.v),
                  child: Text(
                    bottomMenuList[index].title ?? "",
                    style: theme.textTheme.labelMedium!.copyWith(
                      color: appTheme.whiteA700,
                    ),
                  ),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImageView(
                  imagePath: bottomMenuList[index].activeIcon,
                  height: 16.adaptSize,
                  width: 16.adaptSize,
                  color: appTheme.gray600,
                ),
                Opacity(
                  opacity: 0.54,
                  child: Padding(
                    padding: EdgeInsets.only(top: 6.v),
                    child: Text(
                      bottomMenuList[index].title ?? "",
                      style: theme.textTheme.bodySmall!.copyWith(
                        color: appTheme.whiteA700.withOpacity(0.55),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            label: '',
          );
        }),
        onTap: widget.onTap ??
            (index) {
              //selectedIndex = index;
              widget.onChanged?.call(bottomMenuList[index].type);
              setState(() {});
            },
      ),
    );
  }
}

enum BottomBarEnum {
  Dashboard,
  Watch,
  Medialibrary,
  More,
}

class BottomMenuModel {
  BottomMenuModel({
    required this.icon,
    required this.activeIcon,
    this.title,
    required this.type,
  });

  String icon;

  String activeIcon;

  String? title;

  BottomBarEnum type;
}

class DefaultWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Please replace the respective Widget here',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
