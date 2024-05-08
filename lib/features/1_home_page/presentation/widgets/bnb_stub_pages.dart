import 'package:flutter/material.dart';

class BnbStubPage extends StatelessWidget {
  final String title;
  const BnbStubPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          title,
          style: const TextStyle(fontSize: 37, fontFamily: 'SF_Pro_Display'),
        ),
      ),
    );
  }
}
