import 'package:get/instance_manager.dart';
import 'package:shortly/core/data/shorten_url_data/shorten_url_datasource/localDataSource/shorten_url_local_datasource.dart';
import 'package:shortly/core/data/shorten_url_data/shorten_url_datasource/remoteDataSource/shorten_url_remote_datasource.dart';
import 'package:shortly/core/data/shorten_url_data/shorten_url_repository/shorten_url_repository_impl.dart';
import 'package:shortly/core/domain/shorten_url_domain/shorten_url_repository/shorten_url_repository.dart';
import 'package:shortly/core/domain/shorten_url_domain/shorten_url_usecases/delete_shorten_url_db_usecase.dart';
import 'package:shortly/core/domain/shorten_url_domain/shorten_url_usecases/get_shorten_url_api_usecase.dart';
import 'package:shortly/core/domain/shorten_url_domain/shorten_url_usecases/get_shorten_url_list_db_usecase.dart';
import 'package:shortly/core/domain/shorten_url_domain/shorten_url_usecases/save_new_shorten_url_db_usecase.dart';
import 'package:shortly/core/presentation/home/controller/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    registerControllers();
    registerUseCases();
    registerRepositories();
    registerDataSources();
  }

  registerControllers() {
    Get.lazyPut<HomeController>(
      () => HomeController(Get.find<GetShortenUrlApiUsecase>(), Get.find<SaveNewShortenUrlDBUsecase>(), Get.find<GetShortenUrlListDBUsecase>(),
          Get.find<DeleteShortenUrlDBUsecase>(),),
    );
  }

  registerUseCases() {
    Get.lazyPut<GetShortenUrlApiUsecase>(() => GetShortenUrlApiUsecase(Get.find<ShortenUrlRepository>()));
    Get.lazyPut<GetShortenUrlListDBUsecase>(() => GetShortenUrlListDBUsecase(Get.find<ShortenUrlRepository>()));
    Get.lazyPut<SaveNewShortenUrlDBUsecase>(() => SaveNewShortenUrlDBUsecase(Get.find<ShortenUrlRepository>()));
    Get.lazyPut<DeleteShortenUrlDBUsecase>(() => DeleteShortenUrlDBUsecase(Get.find<ShortenUrlRepository>()));
  }

  registerRepositories() {
    Get.lazyPut<ShortenUrlRepository>(
      () => ShortenRepositoryImpl(
        Get.find<ShortenUrlRemoteDataSource>(),
        Get.find<ShortenUrlLocalDataSource>(),
      ),
    );
  }

  registerDataSources() {
    Get.lazyPut<ShortenUrlLocalDataSource>(() => ShortenUrlLocalDataSource());
    Get.lazyPut<ShortenUrlRemoteDataSource>(() => ShortenUrlRemoteDataSource());
  }
}
