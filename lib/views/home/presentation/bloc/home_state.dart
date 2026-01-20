part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loading() = _Loading;
  const factory HomeState.failed(Failure error) = _Failed;
  const factory HomeState.success(PortfolioResponse data) = _Success;
}
