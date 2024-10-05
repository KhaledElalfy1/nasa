import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app/features/home/presentation/view/home_view.dart';
import 'package:nasa_app/features/home/presentation/view_model/soil_moisture_cubit/soil_moisture_cubit.dart';
import 'package:nasa_app/features/home/presentation/view_model/water_recources_cubit/water_recources_cubit.dart';
import 'package:nasa_app/features/home/presentation/view_model/weather_cubit/weather_cubit.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 150,
            ),
            Image.asset(
              "assets/images/rice field-bro.png",
            ),
            const Expanded(child: SizedBox()),
            ElevatedButton(
              style: TextButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: const Color(0xff1B5E37),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => MultiBlocProvider(
                      providers: [
                        BlocProvider(
                          create: (context) =>
                              WaterRecoursesCubit()..getWaterRecourses(),
                        ),
                        BlocProvider(
                          create: (context) =>
                              SoilMoistureCubit()..getSoilMoistureData(),
                        ),
                        BlocProvider(
                          create: (context) => WeatherCubit()..getWeatherData(),
                        ),
                      ],
                      child: const HomeView(),
                    ),
                  ),
                );
              },
              child: const Text(
                'Let\'s get started',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
}
