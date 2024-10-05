import 'package:flutter/material.dart';
import 'package:nasa_app/features/home/data/model/water_recourse_model.dart';
import 'package:url_launcher/url_launcher.dart';

class WaterCardWidget extends StatelessWidget {
  const WaterCardWidget({
    super.key,
    required this.waterRecoursesModel,
    required this.index,
  });
  final WaterRecoursesModel waterRecoursesModel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final url = Uri.parse(
            'https://www.google.com/maps/search/?api=1&query=${waterRecoursesModel.waterbodies[index].waterbody.location.latitude},${waterRecoursesModel.waterbodies[index].waterbody.location.longitude}');

        if (await canLaunchUrl(url)) {
          await launchUrl(url);
        } else {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text(
                  'Can\'t launch url',
                ),
              ),
            );
          }
        }
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Image.asset(
                waterRecoursesModel.waterbodies[index].waterbody.type == 'Lake'
                    ? "assets/images/lake.jpg"
                    : "assets/images/river.jpg",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              waterRecoursesModel.waterbodies[index].waterbody.name,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
