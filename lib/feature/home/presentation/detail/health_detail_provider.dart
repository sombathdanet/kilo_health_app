import 'package:project/core/base/base_provider.dart';
import 'package:project/core/network/error_handler.dart';
import 'package:project/core/network/failure.dart';
import 'package:project/feature/home/domain/home_resposiory.dart';
import 'package:project/feature/home/presentation/detail/health_detail_state.dart';

class HealthDetailProvider extends BaseProvider<HealthDetailState> {
  final HomeRepository _homeRepository;

  HealthDetailProvider(this._homeRepository);
  @override
  onInitUiState() => HealthDetailState();

  void getGridDetail(String id) async {
    try {
      setState((e) => e.loading = true);
      final res = await _homeRepository.getHomeGridDetail(id);
      setState((state) {
        state.homeGridDetialModel = res;
      });
    } on ErrorHandler catch (e) {
      throw Exception(e.failure.message);
    } finally {
      setState((e) => e.loading = false);
    }
  }
}
