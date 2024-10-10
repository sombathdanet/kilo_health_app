import 'package:flutter/material.dart';
import 'package:project/component/ximage_provider.dart';
import 'package:project/feature/home/domain/model/home_grid_item_model.dart';
import 'package:project/theme/text_style/text_style.dart';
import 'package:project/core/view/padding.dart';

class XGridView extends StatelessWidget {
  final List<HomeGridModel> listItem;
  final double heigh;
  final void Function(int) onTapItem;
  final Color cardColor;
  final ScrollController? controller;
  const XGridView({
    super.key,
    required this.listItem,
    this.heigh = 160,
    required this.onTapItem,
    this.cardColor = Colors.white,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: const EdgeInsets.only(bottom: XPadding.bigger),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: XPadding.medium,
        mainAxisSpacing: XPadding.medium,
        mainAxisExtent: heigh,
      ),
      itemCount: listItem.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => onTapItem(index),
          child: _buildGridItem(listItem[index], context, cardColor),
        );
      },
    );
  }

  Widget _buildGridItem(HomeGridModel item, context, Color color) {
    return Card(
      borderOnForeground: false,
      margin: EdgeInsets.zero,
      shadowColor: Colors.grey.withOpacity(0.5),
      elevation: 2.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: XImageProvider(
          path: item.thumbnail,
          fit: BoxFit.cover,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: XPadding.medium,
                  vertical: XPadding.medium,
                ),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: color,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    XTextMedium(text: item.name),
                    XTextSmall(text: item.description)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
