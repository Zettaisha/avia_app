import 'package:equatable/equatable.dart';

class SearchTicketEntity extends Equatable {
  final int? id;
  final String? title;
  final List<String>? timeRange;
  final int? price;

  const SearchTicketEntity(this.id, this.title, this.timeRange, this.price);

  @override
  List<Object?> get props {
    return [id, title, timeRange, price];
  }
}
