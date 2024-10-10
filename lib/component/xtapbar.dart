import 'package:flutter/material.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/theme/text_style/text_style.dart';

class XTabBarModel {
  final String label;
  final String icon;
  XTabBarModel({
    required this.label,
    required this.icon,
  });
}

List<XTabBarModel> tabItems = [
  XTabBarModel(
    icon: "assets/icons/logo health.png",
    label: "All",
  ),
  XTabBarModel(
    icon: "assets/icons/kidney.png",
    label: "Kindny",
  ),
  XTabBarModel(
    icon: "assets/icons/lung.png",
    label: "Lung",
  ),
  XTabBarModel(
    icon: "assets/icons/lung.png",
    label: "Lung",
  ),
  XTabBarModel(
    icon: "assets/icons/lung.png",
    label: "Lung",
  )
];

class XTabBar extends StatefulWidget {
  final List<XTabBarModel> tabItems;
  final int currentIndex;
  final Function(int) onChangeIndex;
  const XTabBar({
    super.key,
    required this.tabItems,
    this.currentIndex = 0,
    required this.onChangeIndex,
  });

  @override
  State<XTabBar> createState() => _XTabBarState();
}

class _XTabBarState extends State<XTabBar> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.tabItems.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabAlignment: TabAlignment.center,
      indicatorColor: Colors.transparent,
      onTap: (index) {
        widget.onChangeIndex(index);
      },
      isScrollable: true,
      splashFactory: NoSplash.splashFactory,
      overlayColor:
          WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
        return states.contains(WidgetState.focused) ? null : Colors.transparent;
      }),
      dividerColor: Colors.transparent,
      padding: const EdgeInsets.only(right: XPadding.medium),
      labelPadding: const EdgeInsets.only(right: XPadding.medium),
      controller: _tabController,
      tabs: List.generate(
        tabItems.length,
        (index) => _tabBarCustom(
          tabItems[index],
          context,
          widget.currentIndex,
          index,
        ),
      ),
    );
  }

  Widget _tabBarCustom(
    XTabBarModel xTabBar,
    BuildContext context,
    int currentIndex,
    int index,
  ) {
    final color = currentIndex == 0
        ? null
        : index == 0
            ? Theme.of(context).primaryColor
            : null;
    final textColor = currentIndex == index ? Colors.white : Colors.grey;
    return Container(
      width: 100,
      padding: const EdgeInsets.symmetric(
        vertical: XPadding.medium,
      ),
      decoration: BoxDecoration(
        color: currentIndex == index
            ? Theme.of(context).primaryColor
            : Theme.of(context).cardColor,
        border: Border.all(width: 0.1, color: Colors.black),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            xTabBar.icon,
            color: color,
          ),
          XTextMedium(
            padding: const EdgeInsets.only(top: XPadding.small),
            text: xTabBar.label,
            fontWeight: FontWeight.w400,
            color: textColor,
          )
        ],
      ),
    );
  }
}
