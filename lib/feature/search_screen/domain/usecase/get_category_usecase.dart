import 'package:project/core/base/base_use_case.dart';
import 'package:project/feature/home/domain/model/home_grid_detail_model.dart';
import 'package:project/feature/search_screen/domain/repository/search_repository.dart';

class GetCategoryUsecase implements BaseUseCase<List<CategoryModel>, String> {
  final SearchReposiory _searchReposiory;
  GetCategoryUsecase(this._searchReposiory);

  @override
  Future<List<CategoryModel>> call({String? param}) async {
    final res = await _searchReposiory.getCategory();
    return res;
  }
}
