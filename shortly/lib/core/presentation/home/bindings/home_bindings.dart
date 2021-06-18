import 'package:get/instance_manager.dart';
import 'package:shortly/core/data/shortenUrlData/shortenUrlDataSource/localDataSource/shorten_url_local_datasource.dart';
import 'package:shortly/core/data/shortenUrlData/shortenUrlDataSource/remoteDataSource/shorten_url_remote_datasource.dart';
import 'package:shortly/core/data/shortenUrlData/shortenUrlRepository/shorten_url_repository_impl.dart';
import 'package:shortly/core/domain/shortenUrlDomain/shortenUrlRepository/shorten_url_repository.dart';
import 'package:shortly/core/domain/shortenUrlDomain/shortenUrlUsecases/delete_shorten_url_db_usecase.dart';
import 'package:shortly/core/domain/shortenUrlDomain/shortenUrlUsecases/get_shorten_url_api_usecase.dart';
import 'package:shortly/core/domain/shortenUrlDomain/shortenUrlUsecases/save_new_shorten_url_db_usecase.dart';
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
      () => HomeController(
        Get.find<GetShortenUrlApiUsecase>(),
        Get.find<SaveNewShortenUrlDBUsecase>(),
      ),
    );
  }

  registerUseCases() {
    Get.lazyPut<GetShortenUrlApiUsecase>(() => GetShortenUrlApiUsecase(Get.find<ShortenUrlRepository>()));
    Get.lazyPut<GetShortenUrlApiUsecase>(() => GetShortenUrlApiUsecase(Get.find<ShortenUrlRepository>()));
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
