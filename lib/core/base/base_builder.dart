import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BaseBuilder<T> extends StatelessWidget {
  final Function(T provider, Widget widget) builder;
  const BaseBuilder({
    super.key,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<T>(
      builder: (context, provider, child) => builder(
        provider,
        child ?? const SizedBox.shrink(),
      ),
    );
  }
}
