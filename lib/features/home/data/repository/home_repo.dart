import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/core/services/api/api_services.dart';
import 'package:nasa_app/core/services/location/location_services.dart';
import 'package:nasa_app/features/home/data/model/soil_moisture_id.dart';
import 'package:nasa_app/features/home/data/model/soil_moisture_model/soil_moisture_model.dart';

class HomeRepo {
  final ApiServices apiServices;
  final LocationServices _locationServices = LocationServices();
  final String _apiKey =
      "apk.027aaedd9c1e239f3fe67fade5c0fb538e85d127a320d4f87fb8c6216e5604c8";
  HomeRepo({required this.apiServices});

  Future<String> getTaskId() async {
    final location = await _locationServices.getLocation();

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
            "date_start": "2023-06-01",
            "date_end": "2023-07-01",
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
    return SoilMoistureId.fromJson(response.data).taskId!;
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
    debugPrint("Soil ctime1: ${response.data}");

    return SoilMoistureModel.fromJson(response.data);
  }

  Future<Either<String, SoilMoistureModel>> getSoilMoistureData() async {
    try {
      String taskId = await getTaskId();
      debugPrint("Our task id is: $taskId");
      final soilMoisture = await getSoilMoisture(taskId: taskId);
      debugPrint("Soil ctime10: ${soilMoisture.result}");
      return Right(soilMoisture);
    } on Exception catch (e) {
      debugPrint(e.toString());
      return Left(e.toString());
    }
  }

  
}
