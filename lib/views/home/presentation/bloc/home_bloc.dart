import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:portfolio/core/di/injection.dart';
import 'package:portfolio/core/network/failure.dart';
import 'package:portfolio/core/shared/shimmer/home_page_shimmer.dart';
import 'package:portfolio/core/utils/device_type.dart';
import 'package:portfolio/views/home/domain/entities/portfolio_response.dart';
import 'package:portfolio/views/home/domain/usecase/portfolio_data_usecase.dart';
import 'package:portfolio/views/home/presentation/pages/portfolio_mobile.dart';
import 'package:portfolio/views/home/presentation/pages/portfolio_tab.dart';
import 'package:portfolio/views/home/presentation/pages/portfolio_web.dart';
import 'package:portfolio/views/home/presentation/widgets/error.dart';

part 'home_event.dart';

part 'home_state.dart';

part 'home_bloc.freezed.dart';

part 'package:portfolio/views/home/presentation/pages/home_page.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PortfolioDataUseCase portfolioDataUseCase;
  HomeBloc(this.portfolioDataUseCase) : super(const HomeState.initial()) {
    on<_GetPortFolioData>((event, emit) async {
      emit(_Loading());
      final result = await portfolioDataUseCase("");
      result.fold(
        (failure) => emit(_Failed(failure)),
        (result) => emit(_Success(result)),
      );
    });
  }
}
