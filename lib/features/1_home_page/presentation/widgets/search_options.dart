import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchOptions extends StatelessWidget {
  final String? imageIconPath;
  final String text;
  const SearchOptions({super.key, this.imageIconPath, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 35,
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 15),
        decoration: BoxDecoration(
          color: Colors.grey[800],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            imageIconPath == null
                ? const SizedBox()
                : ImageIcon(
                    AssetImage(imageIconPath!),
                    color: Colors.grey,
                  ),
            const SizedBox(width: 5),
            Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}
