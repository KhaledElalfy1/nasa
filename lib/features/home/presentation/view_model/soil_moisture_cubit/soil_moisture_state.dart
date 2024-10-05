
import 'package:nasa_app/features/home/data/model/soil_moisture_model/soil_moisture_model.dart';

sealed class SoilMoistureState {}

final class SoilMoistureInitial extends SoilMoistureState {}


final class SoilMoistureLoading extends SoilMoistureState {}


final class SoilMoistureLoaded extends SoilMoistureState {
  final SoilMoistureModel soilMoistureModel;
  SoilMoistureLoaded({required this.soilMoistureModel});
}


final class SoilMoistureError extends SoilMoistureState {
  final String message;
  SoilMoistureError({required this.message});
}

