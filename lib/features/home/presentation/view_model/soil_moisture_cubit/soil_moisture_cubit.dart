import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app/core/services/api/api_services.dart';
import 'package:nasa_app/features/home/data/repository/home_repo.dart';
import 'package:nasa_app/features/home/presentation/view_model/soil_moisture_cubit/soil_moisture_state.dart';

class SoilMoistureCubit extends Cubit<SoilMoistureState> {
  SoilMoistureCubit() : super(SoilMoistureInitial());
  static SoilMoistureCubit get(context) => BlocProvider.of(context);
  final HomeRepo homeRepo = HomeRepo(apiServices: ApiServices(dio: Dio()));
  Future<void> getSoilMoistureData() async {
    emit(SoilMoistureLoading());
    final result = await homeRepo.getSoilMoistureData();

    result.fold((l) {
      emit(SoilMoistureError(message: l.toString()));
    }, (r) {
      emit(SoilMoistureLoaded(soilMoistureModel: r));
    });
  }
}
