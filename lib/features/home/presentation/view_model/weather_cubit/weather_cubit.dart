

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app/core/services/api/api_services.dart';
import 'package:nasa_app/features/home/data/repository/home_repo.dart';
import 'package:nasa_app/features/home/presentation/view_model/weather_cubit/weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitial());
  static WeatherCubit get(context) => BlocProvider.of(context);
    final HomeRepo homeRepo = HomeRepo(apiServices: ApiServices(dio: Dio()));

  Future<void> getWeatherData() async {
    emit(WeatherLoading());
    final result = await homeRepo.getWeather();

    result.fold((l) {
      emit(WeatherError(message: l.toString()));
    }, (r) {
      emit(WeatherLoaded(weatherModel: r));
    });
  }
}
