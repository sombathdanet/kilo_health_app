import 'package:project/feature/home/data/model/response/home_grid_response.dart';
import 'package:project/feature/home/domain/model/home_grid_item_model.dart';

extension HomeGridItemMapper on List<HomeGridDataResponse>? {
  List<HomeGridModel> toHomeGridItem() =>
      this?.map((e) => e.toHomeGrid()).toList() ?? [];
}

extension HomeGridMapper on HomeGridDataResponse? {
  HomeGridModel toHomeGrid() {
    return HomeGridModel(
      id: this?.id ?? 0,
      type: this?.type ?? "No Type",
      name: this?.name ?? "No Name",
      description: this?.description ?? "No Description",
      thumbnail: this?.thumbnail ?? "",
      favorite: this?.favorite ?? false,
      createdAt: this?.createdAt ?? "No Data",
    );
  }
}
