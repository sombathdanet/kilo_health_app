import 'package:project/feature/home/domain/model/home_grid_detail_model.dart';
import 'package:project/feature/home/domain/model/home_grid_item_model.dart';
import 'package:project/feature/home/domain/model/home_slider_model.dart';

abstract class HomeRepository {
  Future<List<HomeGridModel>> getHomeGridData(int page,int size);
  Future<List<HomeGridModel>> getHomeGridDataLocal();
  Future<HomeGridDetialModel> getHomeGridDetail(String id);
  Future<SliderModel> getHomeSlider();
}
