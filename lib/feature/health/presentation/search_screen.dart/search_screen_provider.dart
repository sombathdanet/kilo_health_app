import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:project/core/base/base_provider.dart';
import 'package:project/core/network/error_handler.dart';
import 'package:project/data/model.dart';
import 'package:project/feature/health/domain/model/searh_model.dart';
import 'package:project/feature/health/domain/usecase/get_category_usecase.dart';
import 'package:project/feature/health/domain/usecase/search_usecase.dart';
import 'package:project/feature/health/presentation/search_screen.dart/search_state.dart';

class SearchScreenProvider extends BaseProvider<SearchState> {
  final SearchUseCase _searchUseCase;

  final GetCategoryUsecase _getCategoryUsecase;

  SearchScreenProvider(this._searchUseCase, this._getCategoryUsecase);

  final TextEditingController textEditingController = TextEditingController();

  late final ScrollController scrollController = ScrollController();

  List<SearchItemModel> searchItem = [];

  void changeTap(int index) {
    setState((state) {
      state.currentIndex = index;
      state.tabQuery = uiState.categoryItem[uiState.currentIndex].name;
    });

    filterCategory(
      uiState.categoryItem[uiState.currentIndex].name,
    );
  }

  void changePage(int index) {
    setState((state) {
      state.currentPageIndex = index;
    });
  }

  void search({
    String? query,
    int? page,
  }) async {
    try {
      setState((e) {
        e.searchLoading = true;
      });
      final res = await _searchUseCase.call(
        param: QueryModel(
          query: query,
          page: page,
          tabarIndex: uiState.currentIndex,
        ),
      );
      setState((e) {
        e.searchItemUi = res.toSearchItem();
      });
      searchItem.add(
        SearchItemModel(
          category: query ?? "",
          item: res.toSearchItem(),
          isAlreadyLoad: true,
        ),
      );
    } on ErrorHandler catch (e) {
      if (kDebugMode) {
        print(e.failure.message);
      }
    } finally {
      setState((e) {
        e.searchLoading = false;
      });
    }
  }

  void filterCategory(
    String? query,
  ) async {
    try {
      final isContain = searchItem.indexWhere((e) => e.category == query);
      if (isContain != -1) {
        setState((e) {
          e.filterLoading = false;
          e.searchItemUi = searchItem[isContain].item;
        });
      }
      if (isContain == -1) {
        setState((e) => e.filterLoading = true);
        final res = await _searchUseCase.call(
          param: QueryModel(
            query: query,
            tabarIndex: uiState.currentIndex,
          ),
        );
        setState((e) {
          e.searchItemUi = res.toSearchItem();
        });
        searchItem.add(
          SearchItemModel(
            category: query ?? "",
            item: res.toSearchItem(),
            isAlreadyLoad: true,
          ),
        );
        setState((e) {
          e.filterLoading = false;
        });
      }
    } on ErrorHandler catch (e) {
      if (kDebugMode) {
        print(e.failure.message);
      }
    } finally {
      setState((e) {
        e.filterLoading = false;
      });
    }
  }

  void loadMoreAllCategory({bool loadMore = false}) async {
    try {
      final res = await _searchUseCase.call(
        param: QueryModel(
          tabarIndex: uiState.currentIndex,
        ),
        loadMore: loadMore,
      );
      if (loadMore) {
        setState((e) {
          e.searchItemUi = uiState.searchItemUi + res.toSearchItem();
        });
      }
    } on ErrorHandler catch (e) {
      if (kDebugMode) {
        print(e.failure.message);
      }
    } finally {
      setState((e) {
        e.isFetchingData = false;
      });
    }
  }

  void getCateogryItem() async {
    try {
      final res = await _getCategoryUsecase.call();
      setState((e) {
        e.categoryItem = res;
        e.loading = false;
      });
    } on ErrorHandler catch (e) {
      setState((e) {
        e.loading = false;
      });
      if (kDebugMode) {
        print(e.failure.message);
      }
    }
  }

  void listenPaging() {
    scrollController.addListener(() {
      final maxScroll = scrollController.position.maxScrollExtent - 1;
      final currentScroll = scrollController.position.pixels - 1;
      if (currentScroll == maxScroll && uiState.currentIndex == 0) {
        setState((e) => e.isFetchingData = true);
        loadMoreAllCategory(loadMore: uiState.isFetchingData);
      }
    });
  }

  @override
  onInitUiState() => SearchState();
}

extension SearchItemMapper on List<SerachModelUI> {
  SearchItemModel toSearchItemModel() {
    return SearchItemModel(
      category: "",
      isAlreadyLoad: false,
      item: map((e) => e.toSearch()).toList(),
    );
  }
}

extension SearchUIItemMapper on List<SerachModelUI> {
  List<SearchModel> toSearchItem() {
    return map((e) => e.toSearch()).toList();
  }
}

extension SearchUIMapper on SerachModelUI {
  SearchModel toSearch() {
    return SearchModel(
      id: id,
      title: name,
      subtitle: description,
      thumnail: thumbnail,
    );
  }
}
