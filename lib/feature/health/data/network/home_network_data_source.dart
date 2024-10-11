import 'package:project/core/base/base_response.dart';
import 'package:project/core/network/network_config.dart';
import 'package:project/core/network/networkdata_source.dart';
import 'package:project/feature/health/data/model/response/home_grid_detail_response.dart';
import 'package:project/feature/health/data/model/response/home_grid_response.dart';
import 'package:project/feature/health/data/model/response/home_slider_response.dart';
import 'package:project/feature/health/data/model/response/search_response.dart';
import 'package:project/feature/health/data/network/home_end_point.dart';
import 'package:project/feature/health/data/model/response/categoryresponse.dart';

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

  Future<BaseResponse<CategoryResponse>> getHomeCategory() async {
    final res =
        await NetWorkDataSource.instance.get(path: HomeEndPoint.getCategory);
    return BaseResponse.fromJson(
      res,
      (json) => CategoryResponse.fromJson(json as Map<String, dynamic>),
    );
  }

  Future<BaseResponse<List<SerachResponse>>> getSearch({
    String? queryParameters,
    int? page,
  }) async {
    final query = _mapQuery(queryParameters, page, 10);

    final res = await NetWorkDataSource.instance.get(
      path: HomeEndPoint.searchEndPoint,
      queryParameters: query,
    );

    return BaseResponse.fromJson(
      res,
      (json) => (json as List).map((e) => SerachResponse.fromJson(e)).toList(),
    );
  }

  Future<BaseResponse<List<CategoryResponse>>> getCategoryResponse() async {
    final res =
        await NetWorkDataSource.instance.get(path: HomeEndPoint.getCategory);
    return BaseResponse.fromJson(
      res,
      (json) =>
          (json as List).map((e) => CategoryResponse.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic>? _mapQuery(
    String? query,
    int? page,
    int? size,
  ) {
    if (query != null) {
      return {
        HomeEndPoint.searchKey: query,
        HomeEndPoint.page: page,
        HomeEndPoint.size: size,
      };
    }
    return {
      HomeEndPoint.page: page,
      HomeEndPoint.size: size,
    };
  }
}
