import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nasa_app/features/home/presentation/view/widgets/water_card_widget.dart';
import 'package:nasa_app/features/home/presentation/view_model/water_recources_cubit/water_recources_cubit.dart';
import 'package:nasa_app/features/home/presentation/view_model/water_recources_cubit/water_recources_state.dart';

class NearestWaterRecourseView extends StatelessWidget {
  const NearestWaterRecourseView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WaterRecoursesCubit, WaterRecourcesState>(
      builder: (context, state) {
        if (state is WaterRecoursesLoaded) {
          return GridView.builder(
            itemCount: 8,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) => WaterCardWidget(
                waterRecoursesModel: state.waterRecoursesModel, index: index),
          );
        } else if (state is WaterRecourcesError) {
          return Center(
            child: Text(state.message),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
