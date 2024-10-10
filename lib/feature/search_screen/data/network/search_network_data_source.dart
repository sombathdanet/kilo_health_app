import 'package:project/core/base/base_response.dart';
import 'package:project/core/network/networkdata_source.dart';
import 'package:project/feature/search_screen/data/model/response/categoryresponse.dart';
import 'package:project/feature/search_screen/data/model/response/search_response.dart';
import 'package:project/feature/search_screen/data/network/search_end_point.dart';

class SearchNetWorkDataSource {
  Future<BaseResponse<List<SerachResponse>>> getSearch({
    String? queryParameters,
    int? page,
  }) async {
    print("Query ----------->"+ queryParameters.toString());
    final query = _mapQuery(queryParameters, page, 10);

    final res = await NetWorkDataSource.instance.get(
      path: SearchEndPoint.searchEndPoint,
      queryParameters: query,
    );

    return BaseResponse.fromJson(
      res,
      (json) => (json as List).map((e) => SerachResponse.fromJson(e)).toList(),
    );
  }

  Future<BaseResponse<List<CategoryResponse>>> getCategoryResponse() async {
    final res =
        await NetWorkDataSource.instance.get(path: SearchEndPoint.getCategory);
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
        SearchEndPoint.searchKey: query,
        SearchEndPoint.page: page,
        SearchEndPoint.size: size,
      };
    }
    return {
        SearchEndPoint.page: page,
        SearchEndPoint.size: size,
      };
  }
}
