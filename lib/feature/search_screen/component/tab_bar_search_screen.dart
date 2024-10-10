import 'package:flutter/material.dart';
import 'package:project/core/view/padding.dart';
import 'package:project/feature/home/domain/model/home_grid_detail_model.dart';
import 'package:project/theme/text_style/text_style.dart';

class XSearchTabBar extends StatefulWidget {
  final int currentIndex;
  final Function(int) onChangeIndex;
  final Widget content;
  final List<CategoryModel> categoryItem;
  final Color color;
  const XSearchTabBar({
    super.key,
    this.currentIndex = 0,
    required this.onChangeIndex,
    required this.content,
    required this.categoryItem,
    this.color = Colors.grey,
  });

  @override
  State<XSearchTabBar> createState() => _XTabBarState();
}

class _XTabBarState extends State<XSearchTabBar> with TickerProviderStateMixin {
  late final TabController _tabController;
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: widget.categoryItem.length,
      vsync: this,
    );
    _tabController.addListener(() {
      setState(() {
        _isLoading = true;
      });
      widget.onChangeIndex(_tabController.index);
      Future.delayed(const Duration(seconds: 1)).then((value) {
        setState(() {
          _isLoading = false;
        });
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TabBar(
          tabAlignment: TabAlignment.start,
          indicatorColor: Colors.black,
          onTap: (index) {
            widget.onChangeIndex(index);
          },
          isScrollable: true,
          splashFactory: NoSplash.splashFactory,
          overlayColor: WidgetStateProperty.resolveWith<Color?>(
              (Set<WidgetState> states) {
            return states.contains(WidgetState.focused)
                ? null
                : Colors.transparent;
          }),
          dividerColor: Colors.transparent,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 1,
          controller: _tabController,
          tabs: List.generate(
            widget.categoryItem.length,
            (index) => _tabBarCustom(
              widget.categoryItem[index],
              context,
              widget.currentIndex,
              index,
            ),
          ),
        ),
        _isLoading
            ? Expanded(
                child: Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              ))
            : Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: List.generate(
                    widget.categoryItem.length,
                    (index) {
                      return widget.content;
                    },
                  ),
                ),
              )
      ],
    );
  }

  Widget _tabBarCustom(
    CategoryModel searchTapitem,
    BuildContext context,
    int currentIndex,
    int index,
  ) {
    return XTextMedium(
      text: searchTapitem.name,
      color: currentIndex == index
          ? Theme.of(context).colorScheme.secondary
          : Colors.grey,
      fontWeight: currentIndex == index ? FontWeight.w500 : FontWeight.w400,
      padding: const EdgeInsets.symmetric(vertical: XPadding.medium),
    );
  }

  // Widget _buildShimmer() {
  //   return Shimmer.fromColors(
  //     baseColor: widget.color,
  //     highlightColor: Colors.grey.shade100,
  //     enabled: true,
  //     child: ListView.separated(
  //       itemCount: 10,
  //       separatorBuilder: (context, index) {
  //         return const SizedBox(
  //           height: XPadding.medium,
  //         );
  //       },
  //       itemBuilder: (context, index) {
  //         return Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Expanded(
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   Container(
  //                     alignment: Alignment.topCenter,
  //                     margin: const EdgeInsets.only(right: XPadding.medium),
  //                     padding:
  //                         const EdgeInsets.symmetric(vertical: XPadding.medium),
  //                     decoration: BoxDecoration(
  //                       color: Theme.of(context).colorScheme.primaryContainer,
  //                       borderRadius: BorderRadius.circular(5),
  //                     ),
  //                   ),
  //                   Container(
  //                     alignment: Alignment.bottomCenter,
  //                     margin: const EdgeInsets.only(
  //                         right: XPadding.medium, top: XPadding.medium),
  //                     padding:
  //                         const EdgeInsets.symmetric(vertical: XPadding.medium),
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(5),
  //                       color: Theme.of(context).colorScheme.primaryContainer,
  //                     ),
  //                   ),
  //                   Container(
  //                     alignment: Alignment.bottomCenter,
  //                     margin: const EdgeInsets.only(
  //                       right: XPadding.medium,
  //                       top: XPadding.medium,
  //                     ),
  //                     padding:
  //                         const EdgeInsets.symmetric(vertical: XPadding.medium),
  //                     decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(5),
  //                       color: Theme.of(context).colorScheme.primaryContainer,
  //                     ),
  //                   )
  //                 ],
  //               ),
  //             ),
  //             Container(
  //               height: 80,
  //               width: 120,
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(5),
  //                 color: Theme.of(context).colorScheme.primaryContainer,
  //               ),
  //             )
  //           ],
  //         );
  //       },
  //     ),
  //   );
  // }
}
