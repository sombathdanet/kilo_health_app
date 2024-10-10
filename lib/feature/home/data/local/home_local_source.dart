import 'dart:convert';
import 'package:project/core/local/local_mananger.dart';
import 'package:project/feature/home/data/local/home_local_key.dart';
import 'package:project/feature/home/data/mapper/home_grid_res_mapper.dart';
import 'package:project/feature/home/data/mapper/home_slider_response_mapper.dart';
import 'package:project/feature/home/data/model/response/home_grid_detail_response.dart';
import 'package:project/feature/home/data/model/response/home_grid_response.dart';
import 'package:project/feature/home/data/model/response/home_slider_response.dart';
import 'package:project/feature/home/domain/model/home_grid_item_model.dart';
import 'package:project/feature/home/domain/model/home_slider_model.dart';

class HomeLocalDataSource {
  Future<List<HomeGridModel>> getHomeGridLocal() async {
    final list = await LocalStorageManageer.instance
        .getStringList(HomeLocalKey.homeGridKey);
    final res =
        list.map((e) => HomeGridDataResponse.fromJson(jsonDecode(e))).toList();
    return res.toHomeGridItem();
  }

  Future<bool> saveHomeGridItem(List<HomeGridDataResponse>? list) {
    final listEncode = list?.map((e) => jsonEncode(e)).toList() ?? [];
    return LocalStorageManageer.instance
        .setStringList(HomeLocalKey.homeGridKey, listEncode);
  }

  Future<bool> saveSlider(SliderResponse? sliderItem) {
    final listEncode = jsonEncode(sliderItem);
    return LocalStorageManageer.instance
        .setString(HomeLocalKey.homeSliderKey, listEncode);
  }

  Future<SliderModel> getSlider() async {
    final res = await LocalStorageManageer.instance
        .getString(HomeLocalKey.homeSliderKey);
    final result = SliderResponse.fromJson(jsonDecode(res));
    return result.toSilderModel();
  }

  Future<bool> saveHomeViewGrid(HomeGridDetailResponse? item) async {

    final listAll = await _getHomeGridItemResponse();

    if (item != null) {
      listAll.add(item);
      return _saveAsList(listAll);
    }
    return false;
  }

  Future<bool> _saveAsList(List<HomeGridDetailResponse> list) async {
    final listEncode = list.map((e) => jsonEncode(e)).toList();

    return LocalStorageManageer.instance.setStringList(
      HomeLocalKey.homeGridDetail,
      listEncode,
    );
  }

  Future<List<HomeGridDetailResponse>> _getHomeGridItemResponse() async {
    final list = await LocalStorageManageer.instance
        .getStringList(HomeLocalKey.homeGridDetail);
    return list
        .map((e) => HomeGridDetailResponse.fromJson(jsonDecode(e)))
        .toList();
  }

  Future<HomeGridDetailResponse?> getViewHomeGrid(String id) async {
    final listAll = await _getHomeGridItemResponse();
    final index = listAll.indexWhere((e) => e.id.toString() == id);
    if (index != -1) {
      return listAll[index];
    }
    return null;
  }
}
