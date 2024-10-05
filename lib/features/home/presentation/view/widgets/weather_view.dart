import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app/features/home/presentation/view_model/weather_cubit/weather_cubit.dart';
import 'package:nasa_app/features/home/presentation/view_model/weather_cubit/weather_state.dart';

class WeatherView extends StatelessWidget {
  const WeatherView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Info'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: BlocBuilder<WeatherCubit, WeatherState>(
            builder: (context, state) {
              if (state is WeatherLoaded) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Current Weather',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        WeatherDetailRow(
                          label: 'Temperature',
                          value: '${state.weatherModel.current!.tempC}°C',
                          icon: Icons.thermostat_rounded,
                        ),
                        const SizedBox(height: 8),
                        WeatherDetailRow(
                          label: 'Humidity',
                          value: '${state.weatherModel.current!.humidity}%',
                          icon: Icons.water_drop_rounded,
                        ),
                        const SizedBox(height: 8),
                        WeatherDetailRow(
                          label: 'Wind Speed',
                          value: '${state.weatherModel.current!.windKph} KM/h',
                          icon: Icons.air_rounded,
                        ),
                        const SizedBox(height: 8),
                        WeatherDetailRow(
                          label: 'Wind Direction',
                          value: state.weatherModel.current!.windDir!,
                          icon: Icons.explore_rounded,
                        ),
                        const SizedBox(height: 8),
                        WeatherDetailRow(
                          label: 'Pressure',
                          value: '${state.weatherModel.current!.pressureIn} in',
                          icon: Icons.speed_rounded,
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is WeatherError) {
                return Center(
                  child: Text(
                    state.message,
                    style: const TextStyle(fontSize: 18, color: Colors.red),
                  ),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class WeatherDetailRow extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;

  const WeatherDetailRow({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.blueAccent),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            '$label:',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
