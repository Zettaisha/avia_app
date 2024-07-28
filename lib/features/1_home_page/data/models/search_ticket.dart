import 'package:avia_app/features/1_home_page/domain/enitites/search_ticket.dart';

class SearchTicketModel extends SearchTicketEntity {
  const SearchTicketModel(
      {int? id, String? title, List<String>? timeRange, int? price})
      : super(id, title, timeRange, price);

  factory SearchTicketModel.fromJson(Map<String, dynamic> map) {
    final timeRange = (map['time_range'] as List<dynamic>?)
        ?.map((item) => item as String)
        .toList();
    final price = map['price'];
    return SearchTicketModel(
      id: map['id'] ?? 0,
      title: map['title'] ?? '',
      timeRange: timeRange ?? [],
      price: (price != null &&
              price is Map<String, dynamic> &&
              price['value'] != null)
          ? price['value']
          : 0,
    );
  }

  @override
  String toString() {
    return 'id: $id, title: $title, timerange: $timeRange, price: $price';
  }
}
