import 'package:avia_app/core/constants/constants.dart';
import 'package:avia_app/features/1_home_page/domain/enitites/music_ticket.dart';
import 'package:flutter/cupertino.dart';

class MusicTicketCard extends StatelessWidget {
  const MusicTicketCard({super.key, this.musicTicket});
  final MusicTicketEnitity? musicTicket;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ClipRRect(
          borderRadius:
              BorderRadius.circular(16), // Задаем радиус закругления углов
          child: Image.asset(
            'lib/assets/images/music_ticket_${musicTicket!.id!}.jpg',
            height: 132,
            width: 133,
            fit: BoxFit.fill,
          ),
        ),
        Text(
          musicTicket!.title!,
        ),
        Text(musicTicket!.town!),
        Row(
          children: [
            const ImageIcon(AssetImage(bnbPlaneImagePath)),
            Text('от ${musicTicket!.price} ₽')
          ],
        )
      ],
    );
  }
}
