import 'package:avia_app/core/resources/data_state.dart';
import 'package:avia_app/features/1_home_page/domain/enitites/music_ticket.dart';

abstract class MusicTicketRepository {
  Future<DataState<List<MusicTicketEnitity>>> getMusicTickets();
}
