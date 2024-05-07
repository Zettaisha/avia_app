import 'package:avia_app/features/1_home_page/presentation/bloc/homepage_bloc.dart';
import 'package:avia_app/features/1_home_page/presentation/bloc/homepage_event.dart';
import 'package:avia_app/features/1_home_page/presentation/pages/homepage.dart';
import 'package:avia_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MusicTicketsBloc>(
      create: (context) => sl()..add(const GetMusicTickets()),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Homepage(),
      ),
    );
  }
}
