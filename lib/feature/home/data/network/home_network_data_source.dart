import 'package:project/core/base/base_response.dart';
import 'package:project/core/network/network_config.dart';
import 'package:project/core/network/networkdata_source.dart';
import 'package:project/feature/home/data/model/response/home_grid_detail_response.dart';
import 'package:project/feature/home/data/model/response/home_grid_response.dart';
import 'package:project/feature/home/data/model/response/home_slider_response.dart';
import 'package:project/feature/home/data/network/home_end_point.dart';

class HomeNetworkDataSource {
  Future<BaseResponse<SliderResponse>> getHomeSlider() async {
    final res = await NetWorkDataSource.instance.get(
      path: HomeEndPoint.getSlider,
    );
    return BaseResponse.fromJson(
      res,
      (json) => SliderResponse.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<BaseResponse<List<HomeGridDataResponse>>> getHomeGridItem({
    int page = 1,
    int size = 10,
  }) async {
    final res = await NetWorkDataSource.instance
        .get(path: HomeEndPoint.getHomeGrid, queryParameters: {
      NetWorkConfig.page: page,
      NetWorkConfig.size: size,
    });
    return BaseResponse.fromJson(
      res,
      (json) =>
          (json as List).map((e) => HomeGridDataResponse.fromJson(e)).toList(),
    );
  }

  Future<BaseResponse<HomeGridDetailResponse>> getHomeGridDetail(
      String id) async {
    final res = await NetWorkDataSource.instance.get(
      path: HomeEndPoint.getGridDetail + id,
    );
    return BaseResponse.fromJson(
      res,
      (json) => HomeGridDetailResponse.fromJson(json as Map<String, dynamic>),
    );
  }
}
