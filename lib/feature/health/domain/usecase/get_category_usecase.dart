import 'package:project/core/base/base_use_case.dart';
import 'package:project/feature/health/domain/home_resposiory.dart';
import 'package:project/feature/health/domain/model/home_grid_detail_model.dart';

class GetCategoryUsecase implements BaseUseCase<List<CategoryModel>, String> {
  final HomeRepository _searchReposiory;
  GetCategoryUsecase(this._searchReposiory);

  @override
  Future<List<CategoryModel>> call({String? param}) async {
    final res = await _searchReposiory.getCategory();
    return res;
  }
}
