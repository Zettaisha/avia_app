import 'package:avia_app/config/themes/colors.dart';
import 'package:avia_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class PopularDestination extends StatelessWidget {
  const PopularDestination(
      {super.key, required this.cityName, required this.imagePath});
  final String cityName;
  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              imagePath,
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              cityName,
              style: TextStyle(
                  fontSize: 16,
                  color: AppColors.white,
                  fontFamily: fontSfProDisplay,
                  fontWeight: FontWeight.w600),
            ),
            const Text(
              'Популярное направление',
              style: TextStyle(
                fontFamily: fontSfProDisplay,
                fontSize: 14,
                color: Colors.grey,
              ),
            )
          ],
        )
      ],
    );
  }
}
