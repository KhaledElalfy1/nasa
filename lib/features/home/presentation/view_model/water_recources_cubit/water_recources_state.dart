import 'package:nasa_app/features/home/data/model/water_recourse_model.dart';

sealed class WaterRecourcesState {}

final class WaterRecourcesInitial extends WaterRecourcesState {}

final class WaterRecourcesLoading extends WaterRecourcesState {}

final class WaterRecoursesLoaded extends WaterRecourcesState {
  final WaterRecoursesModel waterRecoursesModel;
  WaterRecoursesLoaded({required this.waterRecoursesModel});
}

final class WaterRecourcesError extends WaterRecourcesState {
  final String message;
  WaterRecourcesError({required this.message});
}
