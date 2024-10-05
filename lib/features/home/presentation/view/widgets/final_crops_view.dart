import 'package:flutter/material.dart';

class FinalCropsView extends StatelessWidget {
  final double soilMoistureAvg = 20.7; // Average soil moisture in percentage
  final double currentTemp = 17.8;

  const FinalCropsView({super.key}); // Current temperature in Celsius

  @override
  Widget build(BuildContext context) {
    List<String> cropSuggestions = suggestCrops(soilMoistureAvg, currentTemp);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggested Crops'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: cropSuggestions.isEmpty
            ? const Center(
                child: Text('No crops suggested',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)))
            : ListView.builder(
                itemCount: cropSuggestions.length,
                itemBuilder: (context, index) {
                  return CropCard(cropName: cropSuggestions[index]);
                },
              ),
      ),
    );
  }

  // Function to suggest crops based on soil moisture and temperature
  List<String> suggestCrops(double soilMoisture, double temp) {
    Set<String> crops = {};

    // Suggest crops based on soil moisture
    if (soilMoisture < 15) {
      crops.add("Cacti");
      crops.add("Sorghum");
    } else if (soilMoisture < 20) {
      crops.add("Corn");
      crops.add("Beans");
    } else if (soilMoisture < 25) {
      crops.add("Tomatoes");
      crops.add("Peppers");
    } else {
      crops.add("Lettuce");
      crops.add("Spinach");
    }

    // Suggest additional crops based on temperature
    if (temp < 10) {
      crops.add("Garlic");
      crops.add("Onions");
    } else if (temp < 20) {
      crops.add("Broccoli");
      crops.add("Cauliflower");
    } else {
      crops.add("Watermelons");
      crops.add("Pumpkins");
    }

    return crops.toList(); // Return unique crop suggestions
  }
}

class CropCard extends StatelessWidget {
  final String cropName;

  const CropCard({Key? key, required this.cropName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        leading: const Icon(
          Icons.eco,
          color: Colors.green,
          size: 40,
        ),
        title: Text(
          cropName,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: const Text('Best suited for current conditions'),
      ),
    );
  }
}
// <a href="https://storyset.com/industry">Industry illustrations by Storyset</a>