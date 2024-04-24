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
      icon: ImageConstant.home,
      activeIcon: ImageConstant.home,
      title: "Home",
      type: BottomBarEnum.Home,
    ),
    BottomMenuModel(
      icon: ImageConstant.imgSearch,
      activeIcon: ImageConstant.imgNavWatch,
      title: "Search",
      type: BottomBarEnum.Search,
    ),
    BottomMenuModel(
      icon: ImageConstant.heart,
      activeIcon: ImageConstant.heart,
      title: "Favorites",
      type: BottomBarEnum.Favorites,
    ),
    BottomMenuModel(
      icon: ImageConstant.user,
      activeIcon: ImageConstant.user,
      title: "User",
      type: BottomBarEnum.User,
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.v,
      decoration: BoxDecoration(
        color: appTheme.blueGray900,
        borderRadius: BorderRadius.circular(
          25.h,
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        showSelectedLabels: true,
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
                  // height: 28.adaptSize,
                  // width: 28.adaptSize,
                  color: appTheme.gray500,
                ),
                // Padding(
                //   padding: EdgeInsets.only(top: 5.v),
                //   child: Text(
                //     bottomMenuList[index].title ?? "",
                //     style: theme.textTheme.labelMedium!.copyWith(
                //       color: appTheme.whiteA700,
                //     ),
                //   ),
                // ),
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
            label: bottomMenuList[index].title ?? "",
          );
        }),
        onTap: widget.onTap ??
            (index) {
              widget.onChanged?.call(bottomMenuList[index].type);
              setState(() {});
            },
      ),
    );
  }
}

enum BottomBarEnum {
  Home,
  Search,
  Favorites,
  User,
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
