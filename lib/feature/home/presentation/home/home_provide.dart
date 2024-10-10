import 'package:flutter/material.dart';
import 'package:project/core/base/base_provider.dart';
import 'package:project/core/network/error_handler.dart';
import 'package:project/feature/home/domain/home_resposiory.dart';
import 'package:project/feature/home/domain/usecase/get_home_grid_usecase.dart';
import 'package:project/feature/home/presentation/home/home_state.dart';
import 'package:project/route.dart';

class HomeProvider extends BaseProvider<HomeState> {
  final HomeRepository _homeRepository;
  final GetHomeGridUseCase _getHomeGridUseCase;
  @override
  onInitUiState() => HomeState();

  HomeProvider(
    this._homeRepository,
    this._getHomeGridUseCase,
  );

  void changeTap(int index) {
    setState((state) {
      state.currentIndex = index;
    });
  }

  void changePage(int index) {
    setState((state) {
      state.currentPageIndex = index;
    });
  }

  void getHomeGridData({bool loadMore = false}) async {
    try {
      final res = await _getHomeGridUseCase.call(loadMore: loadMore);

      if (loadMore) {
        setState((state) {
          state.homeGridItem = state.homeGridItem + res;
        });
      }
      if (!loadMore) {
        setState((state) {
          state.homeGridItem = res;
        });
      }
    } on ErrorHandler catch (e) {
      throw Exception(e.failure.message);
    }
  }

  void navigatorToDetail(BuildContext context, String id) {
    Navigator.of(context).pushNamed(
      AppRoutes.healthDetail,
      arguments: id,
    );
  }

  void getHomeSlider() async {
    try {
      final res = await _homeRepository.getHomeSlider();
      setState((state) {
        state.sliderItem = res;
      });
    } on ErrorHandler catch (e) {
      throw Exception(e.failure.message);
    }
  }

  void setOffSet(double offset) {
    setState((state) {
      state.offset = offset;
    });
  }

  void listenPaging(ScrollController scrollController) {
    scrollController.addListener(() {
      final maxScroll = scrollController.position.maxScrollExtent.toInt();
      final currentScroll = scrollController.position.pixels.toInt();

      if (currentScroll == maxScroll) {
        setState((e) => e.isFetchingData = true);
        getHomeGridData(loadMore: uiState.isFetchingData);
      }
    });
  }
}
