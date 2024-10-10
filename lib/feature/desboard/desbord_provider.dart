import 'package:flutter/material.dart';
import 'package:project/core/base/base_provider.dart';
import 'package:project/feature/desboard/desboard_state.dart';

class DesBoardProvider extends BaseProvider<DesboardState> {
  final pageController = PageController();

  @override
  DesboardState onInitUiState() => DesboardState();

  void navigator(int index) {
    setState((state) {
      state.currentindex = index;
    });
    pageController.jumpToPage(uiState.currentindex);
  }
}
