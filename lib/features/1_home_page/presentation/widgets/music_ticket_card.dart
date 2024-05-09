import 'package:avia_app/config/themes/colors.dart';
import 'package:avia_app/core/constants/constants.dart';
import 'package:avia_app/features/1_home_page/domain/enitites/music_ticket.dart';
import 'package:flutter/cupertino.dart';

class MusicTicketCard extends StatelessWidget {
  const MusicTicketCard({super.key, this.musicTicket});
  final MusicTicketEnitity? musicTicket;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'lib/assets/images/music_ticket_${musicTicket!.id!}.jpg',
                  height: 132,
                  width: 133,
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                musicTicket!.title!,
                style: TextStyle(
                    color: AppColors.white,
                    fontFamily: fontSfProDisplay,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                musicTicket!.town!,
                style: TextStyle(
                    color: AppColors.white,
                    fontFamily: fontSfProDisplay,
                    fontSize: 14),
              ),
              Row(
                children: [
                  ImageIcon(
                    const AssetImage(bnbPlaneImagePath),
                    color: AppColors.white,
                  ),
                  Text(
                    'от ${musicTicket!.price} ₽',
                    style: TextStyle(
                        color: AppColors.white,
                        fontFamily: fontSfProDisplay,
                        fontSize: 16),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
