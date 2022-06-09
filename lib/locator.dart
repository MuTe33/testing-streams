import 'package:get_it/get_it.dart';
import 'package:streams/get_number_use_case.dart';
import 'package:streams/number_repository.dart';
import 'package:streams/tile_view_model.dart';

GetIt locator = GetIt.instance;

extension Initializer on GetIt {
  Future<void> resetDependencies() async {
    await reset();
  }

  void initSyncDependencies() {
    registerLazySingleton(() => NumberRepository());
    registerFactory(() => TileViewModel(get()));
    registerLazySingleton(() => GetNumberUseCase(get()));
  }
}
