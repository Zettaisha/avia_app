import 'package:avia_app/core/constants/constants.dart';
import 'package:flutter/material.dart';

class StubActions extends StatelessWidget {
  const StubActions(
      {super.key,
      required this.imagePath,
      required this.text,
      required this.backgroundColor});
  final String imagePath;
  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            width: 48,
            height: 48,
            decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(16)),
            child: Center(
              child: ImageIcon(
                AssetImage(imagePath),
                color: Colors.white,
              ),
            ),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontFamily: fontSfProDisplay,
                fontSize: 14,
                color: Colors.white),
          )
        ],
      ),
    );
  }
}
