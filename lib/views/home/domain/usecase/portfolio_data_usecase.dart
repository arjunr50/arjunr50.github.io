import 'package:dartz/dartz.dart';
import 'package:portfolio/core/network/failure.dart';
import 'package:portfolio/core/utils/usecase.dart';
import 'package:portfolio/views/home/domain/entities/portfolio_response.dart';
import 'package:portfolio/views/home/domain/repository/home_repository.dart';

class PortfolioDataUseCase extends UseCase<PortfolioResponse, String> {
  final HomeRepository repo;

  PortfolioDataUseCase(this.repo);

  @override
  Future<Either<Failure, PortfolioResponse>> call(String params) async {
    return await repo.getPortfolioData();
  }
}
