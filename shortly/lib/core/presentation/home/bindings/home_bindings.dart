import 'package:get/instance_manager.dart';
import 'package:shortly/core/data/shortenUrlDataSource/localDataSource/shorten_url_local_datasource.dart';
import 'package:shortly/core/data/shortenUrlDataSource/remoteDataSource/shorten_url_remote_datasource.dart';
import 'package:shortly/core/data/shortenUrlRepository/shorten_url_repository_impl.dart';
import 'package:shortly/core/domain/shortenUrlDomain/shortenUrlRepository/shorten_url_repository.dart';
import 'package:shortly/core/domain/shortenUrlDomain/shortenUrlUsecases/get_shorten_url_usecase.dart';
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
    Get.lazyPut<HomeController>(() => HomeController(Get.find<GetShortenUrlUsecase>()));
  }

  registerUseCases() {
    Get.lazyPut<GetShortenUrlUsecase>(() => GetShortenUrlUsecase(Get.find<ShortenUrlRepository>()));
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
