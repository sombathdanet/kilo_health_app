import 'package:project/feature/home/data/model/response/home_grid_detail_response.dart';
import 'package:project/feature/home/domain/model/home_grid_detail_model.dart';

extension HomeGridDetailMapper on HomeGridDetailResponse? {
  HomeGridDetialModel toHomeGridDetailModel() {
    return HomeGridDetialModel(
      id: (this?.id ?? "0").toString(),
      type: this?.type ?? "No Type",
      name: this?.name ?? "No Name",
      description: this?.description ?? "No Description",
      content: this?.content ?? "Content",
      thumbnail: this?.thumbnail ??
          "https://i.pinimg.com/564x/f8/1e/aa/f81eaafae688f5e319b99fdbcafdf22d.jpg",
      views: this?.views ?? 0,
      status: this?.status ?? "No Status",
      favorite: this?.favorite ?? false,
      createdAt: this?.createdAt ?? "No Data",
      categories:
          this?.categories?.map((e) => e.toCategoryModel()).toList() ?? [],
      tags: this?.tags?.map((e) => e.toTageModel()).toList() ?? [],
    );
  }
}

extension on CategoriesRes {
  CategoryModel toCategoryModel() {
    return CategoryModel(
      id: id ?? 0,
      name: name ?? "No Name",
      icon: icon ?? "No Icon",
      order: order ?? 0,
    );
  }
}

extension on TagsRes {
  TagModel toTageModel() {
    return TagModel(
      id: id ?? 0,
      name: name ?? "",
    );
  }
}
