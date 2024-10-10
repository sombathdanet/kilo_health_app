import 'package:flutter/material.dart';
import 'package:project/component/ximage_provider.dart';

import 'package:project/core/view/padding.dart';

class XSlider extends StatelessWidget {
  final List<String> sliderItems;
  final PageController pageController;
  final Function(int)? onPageChanged;
  final double heigh;
  final int currentIndex;

  const XSlider({
    super.key,
    this.sliderItems = const [],
    required this.pageController,
    this.onPageChanged,
    this.currentIndex = 0,
    this.heigh = 160,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        height: heigh,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            PageView(
              controller: pageController,
              onPageChanged: onPageChanged,
              children: sliderItems
                  .map(
                    (e) => _buildItem(e),
                  )
                  .toList(),
            ),
            _buildIndicator(
              sliderItems,
              currentIndex,
              context,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildItem(String image) => XImageProvider(
        path: image,
        fit: BoxFit.fill,
      );

  Widget _buildIndicator(List<String> sliderItem, int currentIndex, context) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          sliderItem.length,
          (index) => Container(
            margin: const EdgeInsets.symmetric(
                horizontal: 1, vertical: XPadding.small),
            height: 8,
            width: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: currentIndex == index
                  ? Theme.of(context).primaryColor
                  : Colors.white,
            ),
          ),
        ),
      );
}
