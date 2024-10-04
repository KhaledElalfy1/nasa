import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nasa_app/core/services/api/api_services.dart';
import 'package:nasa_app/core/services/location/location_services.dart';
import 'package:nasa_app/features/home/data/repository/home_repo.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
             HomeRepo(
              apiServices: ApiServices(
                dio: Dio(),
              ),
            ).getSoilMoistureData();
            // LocationServices().getLocation();
          },
          child: const Text('data'),
        ),
      ),
    );
  }
}
