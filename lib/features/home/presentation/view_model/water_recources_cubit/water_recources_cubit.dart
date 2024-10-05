import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app/core/services/api/api_services.dart';
import 'package:nasa_app/features/home/data/repository/home_repo.dart';
import 'package:nasa_app/features/home/presentation/view_model/water_recources_cubit/water_recources_state.dart';

class WaterRecoursesCubit extends Cubit<WaterRecourcesState> {
  WaterRecoursesCubit() : super(WaterRecourcesInitial());
  static WaterRecoursesCubit get(context) => BlocProvider.of(context);
  HomeRepo homeRepo = HomeRepo(apiServices: ApiServices(dio: Dio()));

  Future<void> getWaterRecourses() async {
    emit(WaterRecourcesLoading());
    final result = await homeRepo.getWaterRecourses();

    result.fold(
      (error) => emit(WaterRecourcesError(message: error)),
      (data) => emit(WaterRecoursesLoaded(waterRecoursesModel: data)),
    );
  }
}
