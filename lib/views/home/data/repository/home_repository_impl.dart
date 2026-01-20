import 'package:dartz/dartz.dart';
import 'package:portfolio/core/network/dio_client.dart';
import 'package:portfolio/core/network/endpoints.dart';
import 'package:portfolio/core/network/failure.dart';
import 'package:portfolio/views/home/domain/entities/portfolio_response.dart';
import 'package:portfolio/views/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  final DioClient dio;

  HomeRepositoryImpl(this.dio);

  @override
  Future<Either<Failure, PortfolioResponse>> getPortfolioData() async {
    try {
      final response = await dio.request(endPoint: EndPoint.portfolio);
      if (response.isSuccess && response.data != null) {
        return Right(PortfolioResponse.fromJson(response.data as Map<String, dynamic>));
      } else {
        return Left(
          Failure(
              code: response.statusCode.toString(),
              message: response.description ?? "Failed"),
        );
      }
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
