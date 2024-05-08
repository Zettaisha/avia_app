import 'package:avia_app/features/1_home_page/presentation/bloc/homepage_bloc.dart';
import 'package:avia_app/features/1_home_page/presentation/bloc/homepage_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BlocBuilder<MusicTicketsBloc, HomepageState>(
      builder: (_, state) {
        if (state is MusicTicketsLoading) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        }

        if (state is MusicTicketsError) {
          return const Center(
            child: Icon(Icons.refresh),
          );
        }
        if (state is MusicTicketsDone) {
          return ListView.builder(
            itemCount: state.musicTickets!.length,
            itemBuilder: (context, index) {
              var musicTicket = state.musicTickets![index];
              return ListTile(
                title: Text(
                    '${musicTicket.title} в ${musicTicket.town}, за ${musicTicket.price}'),
              );
            },
          );
        }
        return const SizedBox();
      },
    ));
  }
}
