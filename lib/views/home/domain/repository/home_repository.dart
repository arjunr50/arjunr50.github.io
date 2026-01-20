import 'package:dartz/dartz.dart';
import 'package:portfolio/core/network/failure.dart';
import 'package:portfolio/views/home/domain/entities/portfolio_response.dart';

abstract class HomeRepository{
  Future<Either<Failure, PortfolioResponse>> getPortfolioData();
}