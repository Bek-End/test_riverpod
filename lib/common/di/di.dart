import 'package:get_it/get_it.dart';
import 'package:test_riverpod/data/repos/remote_repo.dart';
import 'package:test_riverpod/design/logic/recreation_area/recreation_area_bloc.dart';
import 'package:test_riverpod/domain/repositories/remote_repository_impl.dart';
import 'package:test_riverpod/domain/usacases/recreation_area_usecase.dart';

abstract class DI {
  static void init() {
    final getIt = GetIt.I;

    getIt
      ..registerSingleton<RemoteRepo>(RemoteRepositoryImpl())
      ..registerSingleton<RecreationAreaUsecase>(
          RecreationAreaUsecase(remoteRepository: getIt.get()))
      ..registerSingleton<RecreationAreaBloc>(RecreationAreaBloc(getIt.get()));
  }

  static Future<void> dispose() async {
    return GetIt.I.reset();
  }
}
