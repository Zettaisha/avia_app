import 'package:avia_app/core/resources/data_state.dart';
import 'package:avia_app/features/1_home_page/domain/enitites/search_ticket.dart';

abstract class SearchTicketRepository {
  Future<DataState<List<SearchTicketEntity>>> getSearchTickets();
}
