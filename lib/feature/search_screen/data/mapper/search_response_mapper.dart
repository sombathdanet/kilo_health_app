import 'package:project/feature/home/domain/model/home_grid_detail_model.dart';
import 'package:project/feature/search_screen/data/model/response/categoryresponse.dart';
import 'package:project/feature/search_screen/data/model/response/search_response.dart';
import 'package:project/feature/search_screen/domain/model/searh_model.dart';
import 'package:project/utils/constant/image_constant.dart';

extension SearchItemMapper on List<SerachResponse>? {
  List<SerachModelUI> toSearchModelItem() =>
      this?.map((e) => e.toSearchModel()).toList() ?? [];
}

extension SearchModelMapper on SerachResponse {
  SerachModelUI toSearchModel() {
    return SerachModelUI(
      id: (id ?? 0).toString(),
      type: type ?? "No Type",
      name: name ?? "No Name",
      description: description ?? "No Description",
      thumbnail: thumbnail ?? ImageConstant.default_image_network,
      favorite: favorite ?? false,
      createdAt: createdAt ?? "No Data",
    );
  }
}

extension CategoryMapper on List<CategoryResponse>? {
  List<CategoryModel> toCategoryModelItem() =>
      this?.map((e) => e.toCategoryModel()).toList() ?? [];
}

extension CategoryModelMapper on CategoryResponse {
  CategoryModel toCategoryModel() {
    return CategoryModel(
      id: id ?? 0,
      name: name ?? "No Name",
      icon: icon ?? "",
      order: order ?? 0,
    );
  }
}
