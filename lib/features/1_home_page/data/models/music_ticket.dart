import 'package:avia_app/features/1_home_page/domain/enitites/music_ticket.dart';

class MusicTicketModel extends MusicTicketEnitity {
  const MusicTicketModel({int? id, String? title, String? town, int? price})
      : super(id, title, town, price);

  factory MusicTicketModel.fromJson(Map<String, dynamic> map) {
    final price = map['price'];
    return MusicTicketModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      town: map['town'] ?? '',
      price: (price != null &&
              price is Map<String, dynamic> &&
              price['value'] != null)
          ? price['value']
          : 0,
    );
  }

  @override
  String toString() {
    return 'id: $id, title: $title, town: $town, price: $price';
  }
}
