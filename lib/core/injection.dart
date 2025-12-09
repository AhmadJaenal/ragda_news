import 'package:get_it/get_it.dart';

import '../features/dashboard/news/data/datasource/news_remote_datasource.dart';
import '../features/dashboard/news/ui/view-model/news_vew_model.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  locator.registerLazySingleton<NewsRemoteDatasource>(
    () => NewsRemoteDatasource(),
  );
  locator.registerFactory<NewsViewModel>(
    () => NewsViewModel(locator<NewsRemoteDatasource>()),
  );
}
