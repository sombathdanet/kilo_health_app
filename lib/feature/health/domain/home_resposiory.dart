import 'package:project/feature/health/domain/model/home_grid_detail_model.dart';
import 'package:project/feature/health/domain/model/home_grid_item_model.dart';
import 'package:project/feature/health/domain/model/home_slider_model.dart';
import 'package:project/feature/health/domain/model/searh_model.dart';

abstract class HomeRepository {
  Future<List<HomeGridModel>> getHomeGridData(int page, int size);
  Future<List<HomeGridModel>> getHomeGridDataLocal();
  Future<HomeGridDetialModel> getHomeGridDetail(String id);
  Future<SliderModel> getHomeSlider();
  Future<List<SerachModelUI>> search({String? query, int? page});
  Future<List<CategoryModel>> getCategory();
}
