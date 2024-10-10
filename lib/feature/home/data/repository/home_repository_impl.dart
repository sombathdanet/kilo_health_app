import 'package:project/core/network/network_info.dart';
import 'package:project/feature/home/data/local/home_local_source.dart';
import 'package:project/feature/home/data/mapper/home_grid_detail_res_mapper.dart';
import 'package:project/feature/home/data/mapper/home_grid_res_mapper.dart';
import 'package:project/feature/home/data/mapper/home_slider_response_mapper.dart';
import 'package:project/feature/home/data/network/home_network_data_source.dart';
import 'package:project/feature/home/domain/home_resposiory.dart';
import 'package:project/feature/home/domain/model/home_grid_detail_model.dart';
import 'package:project/feature/home/domain/model/home_grid_item_model.dart';
import 'package:project/feature/home/domain/model/home_slider_model.dart';

class HomeRepositoryImpl extends HomeRepository {
  final HomeNetworkDataSource _homeNetworkDataSource;
  final HomeLocalDataSource _homeLocalDataSource;
  final NetWorkInfo _netWorkInfo;

  HomeRepositoryImpl(
    this._homeNetworkDataSource,
    this._homeLocalDataSource,
    this._netWorkInfo,
  );

  @override
  Future<List<HomeGridModel>> getHomeGridData(int page,int size) async {
    final res = await _homeNetworkDataSource.getHomeGridItem(
      page: page,
      size: size
    );
    _homeLocalDataSource.saveHomeGridItem(res.data);
    return res.data.toHomeGridItem();
  }

  @override
  Future<HomeGridDetialModel> getHomeGridDetail(String id) async {
    if (await _netWorkInfo.isConnected) {
      final res = await _homeNetworkDataSource.getHomeGridDetail(id);
      _homeLocalDataSource.saveHomeViewGrid(res.data);
      return res.data.toHomeGridDetailModel();
    }
    final res = await _homeLocalDataSource.getViewHomeGrid(id);
    return res.toHomeGridDetailModel();
  }

  @override
  Future<SliderModel> getHomeSlider() async {
    if (await _netWorkInfo.isConnected) {
      final res = await _homeNetworkDataSource.getHomeSlider();
      _homeLocalDataSource.saveSlider(res.data);
      return res.data.toSilderModel();
    }
    return _homeLocalDataSource.getSlider();
  }

  @override
  Future<List<HomeGridModel>> getHomeGridDataLocal() {
    return _homeLocalDataSource.getHomeGridLocal();
  }
}
