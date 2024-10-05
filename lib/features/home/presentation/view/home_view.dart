import 'package:flutter/material.dart';
import 'package:nasa_app/features/home/presentation/view/widgets/nearest_recourses_view.dart';
import 'package:nasa_app/features/home/presentation/view/widgets/soil_moisture_view.dart';
import 'package:nasa_app/features/home/presentation/view/widgets/weather_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Widget> items = const [
    NearestWaterRecourseView(),
    WeatherView(),
    SoilMoistureView(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
