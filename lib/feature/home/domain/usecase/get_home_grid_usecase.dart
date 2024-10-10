import 'package:project/component/show_toast.dart';
import 'package:project/core/base/base_use_case.dart';
import 'package:project/core/network/network_info.dart';
import 'package:project/feature/home/domain/home_resposiory.dart';
import 'package:project/feature/home/domain/model/home_grid_item_model.dart';
import 'package:project/utils/resource/app_string.dart';

class GetHomeGridUseCase implements BaseUseCase<List<HomeGridModel>, String> {
  final HomeRepository _homeRepository;
  final NetWorkInfo _netWorkInfo;
  GetHomeGridUseCase(this._homeRepository, this._netWorkInfo);
  int page = 1;
  String? message;
  @override
  Future<List<HomeGridModel>> call(
      {String? param, bool loadMore = false}) async {
    if (await _netWorkInfo.isConnected) {
      if (loadMore) {
        page++;
      }
      final res = await _homeRepository.getHomeGridData(page, 10);
      return res;
    }

    if (!await _netWorkInfo.isConnected) {
      message = AppStrings.strNoInternetError;
      if (message != null) {
        showToast(messaeg: message ?? "");
      }
      final res = await _homeRepository.getHomeGridDataLocal();
      return res;
    }

    final res = await _homeRepository.getHomeGridDataLocal();

    if (res.isEmpty) {
      return res;
    }
    return res;
  }
}
