import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/core/services/api/api_services.dart';
import 'package:nasa_app/core/services/location/location_services.dart';
import 'package:nasa_app/features/home/data/model/soil_moisture_model/soil_moisture_model.dart';
import 'package:nasa_app/features/home/data/model/water_recourse_model.dart';
import 'package:nasa_app/features/home/data/model/weather_model/weather_model.dart';

class HomeRepo {
  final ApiServices apiServices;
  final LocationServices _locationServices = LocationServices();
  final String _apiKey =
      "apk.027aaedd9c1e239f3fe67fade5c0fb538e85d127a320d4f87fb8c6216e5604c8";
  HomeRepo({required this.apiServices});

  Future<String> getTaskId() async {
    final response = await apiServices.post(
        url: "https://api-connect.eos.com/api/gdw/api",
        contentType: 'application/json',
        params: {
          'api_key': _apiKey,
        },
        body: {
          "type": "mt_stats",
          "params": {
            "bm_type": "soilmoisture",
            "date_start": "2024-10-5",
            "date_end": "2025-10-01",
            "geometry": {
              "coordinates": [
                [
                  [-86.86718, 41.317464],
                  [-86.86718, 41.331596],
                  [-86.862631, 41.331596],
                  [-86.862631, 41.317464],
                  [-86.86718, 41.317464]
                ]
              ],
              "type": "Polygon"
            },
            "reference": "ref_20200924-00-00",
            "sensors": ["soilmoisture"],
            "limit": 10
          }
        });
    debugPrint("the task id is: ${response.data['task_id']}");
    return response.data['task_id'];
  }

  Future<SoilMoistureModel> getSoilMoisture({required String taskId}) async {
    debugPrint("task id from getSoilMoisture: $taskId?api_key=$_apiKey");
    final response = await apiServices.get(
      url: "https://api-connect.eos.com/api/gdw/api/$taskId?api_key=$_apiKey",
      contentType: 'application/json',
      // params: {
      //   'api_key': _apiKey,
      // },
    );
    if (response.statusCode == 200) {
      return SoilMoistureModel.fromJson(response.data);
    } else {
      throw Exception("Failed to get soil moisture data");
    }
  }

  Future<Either<String, SoilMoistureModel>> getSoilMoistureData() async {
    try {
      String taskId = await getTaskId();
      debugPrint("Our task id is: $taskId");
      Future.delayed(const Duration(seconds: 2));
      final soilMoisture =
          await getSoilMoisture(taskId: '923113c8-5ae5-4096-b4d6-7d7e1e17ae7e');
      debugPrint("Soil ctime10: ${soilMoisture.result}");
      return Right(soilMoisture);
    } catch (e) {
      debugPrint(e.toString());
      return Left(e.toString());
    }
  }

  Future<Either<String, WaterRecoursesModel>> getWaterRecourses() async {
    final location = await _locationServices.getLocation();
    try {
      final response = await apiServices.get(
        url: 'https://api.wateratlas.usf.edu/waterbodies/closest',
        contentType: 'application/json',
        params: {
          'lat': location.latitude,
          'lng': location.longitude,
          'accuracy': 100,
          'len': 10,
          's': 1,
        },
      );
      debugPrint("Water resources: ${response.data['waterbodies']}");
      return Right(WaterRecoursesModel.fromJson(response.data));
    } catch (e) {
      debugPrint(e.toString());
      return Left(e.toString());
    }
  }

  Future<Either<String, WeatherModel>> getWeather() async {
    try {
      final response = await apiServices.get(
        url: 'http://api.weatherapi.com/v1/current.json',
        contentType: 'application/json',
        params: {
          'key': '686616a54f1f4f71aa250342240510',
          'q': 'tanta',
        },
      );
      print(response.data);
      return Right(WeatherModel.fromJson(response.data));
    } catch (e) {
      return Left(e.toString());
    }
  }
}
