import 'package:project/core/base/base_use_case.dart';
import 'package:project/feature/search_screen/domain/model/searh_model.dart';
import 'package:project/feature/search_screen/domain/repository/search_repository.dart';

class QueryModel {
  String? query;
  int? page;
  int? tabarIndex;
  QueryModel({
    this.query,
    this.page,
    this.tabarIndex,
  });
}

class SearchUseCase implements BaseUseCase<List<SerachModelUI>, QueryModel> {
  final SearchReposiory _searchReposiory;
  SearchUseCase(this._searchReposiory);
  int _nextPage = 1;
  @override
  Future<List<SerachModelUI>> call({
    QueryModel? param,
    bool loadMore = false,
  }) async {
    String? queryParameters;

    if (loadMore) {
      _nextPage++;
    }
    if (param?.tabarIndex == 0) {
      queryParameters = null;
      return await _searchReposiory.search(
        query: queryParameters,
        page: _nextPage,
      );
    }

    if (param?.query != null) {
      queryParameters = param?.query;
    }

    final res = await _searchReposiory.search(
      query: queryParameters,
      page: _nextPage,
    );

    return res;
  }
}
