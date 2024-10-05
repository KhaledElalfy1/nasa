import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app/features/home/data/model/water_recourse_model.dart';
import 'package:nasa_app/features/home/presentation/view/widgets/nearest_recourses_view.dart';
import 'package:nasa_app/features/home/presentation/view/widgets/soil_moisture_view.dart';
import 'package:nasa_app/features/home/presentation/view/widgets/water_card_widget.dart';
import 'package:nasa_app/features/home/presentation/view/widgets/weather_view.dart';
import 'package:nasa_app/features/home/presentation/view_model/water_recources_cubit/water_recources_cubit.dart';
import 'package:nasa_app/features/home/presentation/view_model/water_recources_cubit/water_recources_state.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> items =const [
    NearestWaterRecourseView(),
    WeatherView(),
    SoilMoistureView(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: items[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        showUnselectedLabels: false,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        onTap: (value) => setState(() => currentIndex = value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.water),
            label: 'Water',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: 'Weather',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: ' moisture',
          ),
        ],
      ),
    );
  }
}
