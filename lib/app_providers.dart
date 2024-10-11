import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:project/core/local/local_mananger.dart';
import 'package:project/core/network/network_info.dart';
import 'package:project/feature/desboard/desbord_provider.dart';
import 'package:project/feature/health/data/local/home_local_source.dart';
import 'package:project/feature/health/data/network/home_network_data_source.dart';
import 'package:project/feature/health/data/repository/home_repository_impl.dart';
import 'package:project/feature/health/domain/home_resposiory.dart';
import 'package:project/feature/health/domain/usecase/get_home_grid_usecase.dart';
import 'package:project/feature/health/domain/usecase/search_usecase.dart';
import 'package:project/feature/health/presentation/home/home_provide.dart';
import 'package:project/feature/health/presentation/submit_screen/submit_screen_provider.dart';
import 'package:project/feature/search/search_screen_provider.dart';
import 'package:project/feature/search_screen/domain/repository/search_repository.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'core/network/networkdata_source.dart';
import 'feature/health/domain/usecase/get_category_usecase.dart';
import 'feature/health/presentation/detail/health_detail_provider.dart';

class AppProvider {
  static List<SingleChildWidget> bind() {
    return [
      Provider(
        create: (_) => NetWorkDataSource.instance,
      ),
      Provider(
        create: (_) => LocalStorageManageer.instance,
      ),
      Provider(
        create: (_) => HomeNetworkDataSource(),
      ),
      Provider(
        create: (_) => HomeLocalDataSource(),
      ),
      Provider<NetWorkInfo>(
        create: (_) => NetWrokInfoImpl(
          InternetConnectionChecker(),
        ),
      ),
      Provider<HomeRepository>(
        create: (context) => HomeRepositoryImpl(
          context.read<HomeNetworkDataSource>() ,
          context.read<HomeLocalDataSource>(),
          context.read<NetWorkInfo>(),
        ),
      ),
      Provider<GetHomeGridUseCase>(
        create: (context) => GetHomeGridUseCase(
            context.read<HomeRepository>(), context.read<NetWorkInfo>()),
      ),
      ChangeNotifierProvider(
        create: (context) => HomeProvider(
          context.read<HomeRepository>(),
          context.read<GetHomeGridUseCase>(),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => HealthDetailProvider(
          context.read<HomeRepository>(),
        ),
      ),
      ChangeNotifierProvider(
        create: (_) => DesBoardProvider(),
      ),
      // Search Provider
      Provider(
        create: (context) => SearchUseCase(
          context.read<HomeRepository>(),
        ),
      ),
      Provider(
        create: (context) => GetCategoryUsecase(
          context.read<HomeRepository>(),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => SearchScreenProvider(
          context.read<SearchUseCase>(),
          context.read<GetCategoryUsecase>(),
        ),
      ),
      ChangeNotifierProvider(
        create: (context) => SubmitScreenProvider(
          context.read<SearchUseCase>(),
        ),
      ),
    ];
  }
}
