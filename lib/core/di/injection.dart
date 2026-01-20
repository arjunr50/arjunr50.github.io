import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:portfolio/core/network/dio_client.dart';
import 'package:portfolio/views/home/data/repository/home_repository_impl.dart';
import 'package:portfolio/views/home/domain/repository/home_repository.dart';
import 'package:portfolio/views/home/domain/usecase/portfolio_data_usecase.dart';
import 'package:portfolio/views/home/presentation/bloc/home_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Network Layer (Your DioClient)
  _registerNetwork();

  //Presentation Layer (Blocs)
  _registerBlocs();

  //Domain Layer (UseCases)
  _registerUseCases();

  //Data Layer (Repositories → DataSources)
  _registerRepositories();
}

/// 1. Network Layer - Your DioClient (self-contained)
void _registerNetwork() {
  sl.registerLazySingleton<DioClient>(() => DioClient());
}

/// 3. Repository Layer
void _registerRepositories() {
  sl.registerLazySingleton<HomeRepository>(
    () => HomeRepositoryImpl(sl<DioClient>()),
  );
}

/// 4. UseCase Layer
void _registerUseCases() {
  sl.registerLazySingleton<PortfolioDataUseCase>(
    () => PortfolioDataUseCase(sl<HomeRepository>()),
  );
}

/// 5. Presentation Layer (Blocs)
void _registerBlocs() {
  sl.registerFactory<HomeBloc>(
    () => HomeBloc(sl<PortfolioDataUseCase>()),
  );
}

void dispose() {
  sl.reset();
}
