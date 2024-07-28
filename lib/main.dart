import 'package:avia_app/config/themes/colors.dart';
import 'package:avia_app/features/1_home_page/presentation/bloc/homepage_bloc/homepage_bloc.dart';
import 'package:avia_app/features/1_home_page/presentation/bloc/homepage_bloc/homepage_event.dart';
import 'package:avia_app/features/1_home_page/presentation/bloc/search_bloc/search_bloc.dart';
import 'package:avia_app/features/1_home_page/presentation/bloc/search_bloc/search_event.dart';
import 'package:avia_app/features/1_home_page/presentation/pages/bnb_stack.dart';
import 'package:avia_app/features/1_home_page/presentation/pages/search_page.dart';
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
    return BlocProvider<SearchTicketsBloc>(
      create: (context) => sl()..add(const GetSeachTickets()),
      child: MaterialApp(
        theme: theme(),
        debugShowCheckedModeBanner: false,
        home: const SearchPage(),
      ),
    );
  }
}
