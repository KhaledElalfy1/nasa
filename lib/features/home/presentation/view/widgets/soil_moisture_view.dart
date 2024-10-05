import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app/features/home/presentation/view/widgets/soil_moisture_card.dart';
import 'package:nasa_app/features/home/presentation/view_model/soil_moisture_cubit/soil_moisture_cubit.dart';
import 'package:nasa_app/features/home/presentation/view_model/soil_moisture_cubit/soil_moisture_state.dart';

class SoilMoistureView extends StatelessWidget {
  const SoilMoistureView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Soil Moisture Statistics'),
        ),
        body: BlocBuilder<SoilMoistureCubit, SoilMoistureState>(
          builder: (context, state) {
            if (state is SoilMoistureLoaded) {
              return ListView.builder(
                itemCount: state.soilMoistureModel.result!.length,
                itemBuilder: (context, index) => SoilMoistureCard(
                    soilMoistureData: state.soilMoistureModel, index: index),
              );
            } else if (state is SoilMoistureError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }

  // Helper widget to display each stat in a neat format
}
