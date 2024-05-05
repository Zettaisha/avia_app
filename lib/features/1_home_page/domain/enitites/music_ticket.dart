import 'package:equatable/equatable.dart';

class MusicTicketEnitity extends Equatable {
  final int id;
  final String title;
  final String town;
  final int price;

  const MusicTicketEnitity(this.id, this.title, this.town, this.price);

  @override
  List<Object?> get props {
    return [id, title, town, price];
  }
}
