import 'package:avia_app/features/1_home_page/domain/enitites/music_ticket.dart';

class MusicTicketModel extends MusicTicketEnitity {
  const MusicTicketModel({int? id, String? title, String? town, int? price})
      : super(0, '', '', 0);

  factory MusicTicketModel.fromJson(Map<String, dynamic> map) {
    return MusicTicketModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      town: map['town'] ?? '',
      price: (map['price'] != null && map['price']['value'] != null)
          ? map['price']['value']
          : 0,
    );
  }
}
