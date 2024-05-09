import 'package:avia_app/config/themes/colors.dart';
import 'package:avia_app/core/constants/constants.dart';
import 'package:avia_app/features/1_home_page/presentation/bloc/homepage_bloc.dart';
import 'package:avia_app/features/1_home_page/presentation/bloc/homepage_state.dart';
import 'package:avia_app/features/1_home_page/presentation/widgets/music_ticket_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   backgroundColor: AppColors.blackColor,
    //   body: Padding(
    //     padding: const EdgeInsets.only(top: 35, left: 10, right: 10),
    //     child: Column(
    //       children: [
    //         Center(
    //           child: Text(
    //             'Поиск дешевых \nавиабилетов',
    //             textAlign: TextAlign.center,
    //             style: TextStyle(
    //                 color: AppColors.white,
    //                 fontSize: 27,
    //                 height: 1.2,
    //                 fontFamily: fontSfProDisplay,
    //                 fontWeight: FontWeight.w500),
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 35,
    //         ),
    //         Container(
    //           width: 350,
    //           height: 122,
    //           alignment: Alignment.center,
    //           decoration: BoxDecoration(
    //             borderRadius: BorderRadius.circular(16),
    //             color: AppColors.grey3,
    //           ),
    //           child: Container(
    //             width: 296,
    //             height: 90,
    //             decoration: BoxDecoration(
    //                 color: AppColors.grey4,
    //                 borderRadius: BorderRadius.circular(16),
    //                 boxShadow: [
    //                   BoxShadow(
    //                       color: Colors.black.withOpacity(0.5),
    //                       spreadRadius: 5,
    //                       blurRadius: 7,
    //                       offset: const Offset(0, 7))
    //                 ]),
    //             child: Padding(
    //               padding: const EdgeInsets.all(15.0),
    //               child: Row(
    //                 children: [
    //                   Padding(
    //                     padding: const EdgeInsets.only(right: 15),
    //                     child: ImageIcon(
    //                       const AssetImage(searchIconImagePath),
    //                       color: AppColors.white,
    //                     ),
    //                   ),
    //                   Column(
    //                     mainAxisAlignment: MainAxisAlignment.center,
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         'Минск',
    //                         style: TextStyle(
    //                             color: AppColors.white,
    //                             fontSize: 17,
    //                             fontWeight: FontWeight.bold),
    //                       ),
    //                       Text(
    //                         'Куда - Турция',
    //                         style: TextStyle(
    //                             color: AppColors.white,
    //                             fontSize: 17,
    //                             fontWeight: FontWeight.bold),
    //                       )
    //                     ],
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //         const SizedBox(
    //           height: 30,
    //         ),
    //         Align(
    //           alignment: Alignment.centerLeft,
    //           child: Text(
    //             'Музыкально отлететь',
    //             style: TextStyle(
    //               color: AppColors.white,
    //               fontSize: 25,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );

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
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: state.musicTickets!.length,
            itemBuilder: (context, index) {
              var musicTicket = state.musicTickets![index];
              return MusicTicketCard(
                musicTicket: musicTicket,
              );
            },
          );
        }
        return const SizedBox();
      },
    ));
  }
}
