import 'package:flutter/material.dart';
import 'package:project/core/view/padding.dart';

class XListVeritical<T> extends StatelessWidget {
  final List<T> items;
  final Widget Function(BuildContext context, T item, int index) content;
  final EdgeInsets margin;
  final EdgeInsets padding;
  final ScrollController? scrollController;
  const XListVeritical({
    super.key,
    required this.items,
    required this.content,
    this.margin = const EdgeInsets.only(bottom: XPadding.medium),
    this.padding = const EdgeInsets.only(bottom: XPadding.extraLarge),
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      padding: padding,
      separatorBuilder: (context, index) => Padding(
        padding: margin,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) => content(context, items[index], index),
    );
  }
}
