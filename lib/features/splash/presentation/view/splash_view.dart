import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location/location.dart';
import 'package:nasa_app/features/home/presentation/view/home_view.dart';
import 'package:nasa_app/features/home/presentation/view_model/soil_moisture_cubit/soil_moisture_cubit.dart';
import 'package:nasa_app/features/home/presentation/view_model/water_recources_cubit/water_recources_cubit.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    _checkPermissionsAndNavigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/app_logo.png',
          height: 250,
          width: 250,
        ),
      ),
    );
  }

  Future<void> _checkPermissionsAndNavigate() async {
    _getLocation();

    await Future.delayed(const Duration(seconds: 2));
    if (mounted) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => WaterRecoursesCubit()..getWaterRecourses(),
              ),
              BlocProvider(
                create: (context) =>SoilMoistureCubit()..getSoilMoistureData(),
              ),
            ],
            child: const HomeView(),
          ),
        ),
      );
    }
  }

  Future _getLocation() async {
    Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }
}
