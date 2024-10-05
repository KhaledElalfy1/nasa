import 'package:flutter/material.dart';
import 'package:nasa_app/features/home/data/model/soil_moisture_model/soil_moisture_model.dart';

class SoilMoistureCard extends StatelessWidget {
  const SoilMoistureCard(
      {super.key, required this.soilMoistureData, required this.index});
  final SoilMoistureModel soilMoistureData;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Date: ${soilMoistureData.result![index].date}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 2, // 2 columns for stats
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 3,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildStatTile('Q1', soilMoistureData.result![index].q1),
                _buildStatTile('Q3', soilMoistureData.result![index].q3),
                _buildStatTile('Max', soilMoistureData.result![index].max),
                _buildStatTile('Min', soilMoistureData.result![index].min),
                _buildStatTile('P10', soilMoistureData.result![index].p10),
                _buildStatTile('P90', soilMoistureData.result![index].p90),
                _buildStatTile('Std', soilMoistureData.result![index].std),
                _buildStatTile(
                    'Median', soilMoistureData.result![index].median),
                _buildStatTile(
                    'Average', soilMoistureData.result![index].average),
                _buildStatTile(
                    'ctime10', soilMoistureData.result![index].ctime10),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatTile(String label, dynamic value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        const SizedBox(height: 5),
        Text(
          value.toString(),
          style: const TextStyle(fontSize: 14),
        ),
      ],
    );
  }
}
