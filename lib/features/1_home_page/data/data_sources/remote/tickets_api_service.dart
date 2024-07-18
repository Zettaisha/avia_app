import 'package:avia_app/features/1_home_page/data/models/music_ticket.dart';
import 'package:avia_app/features/1_home_page/data/models/search_ticket.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../../core/constants/constants.dart';
import 'package:dio/dio.dart';
part 'tickets_api_service.g.dart';

@RestApi(baseUrl: ticketsAPIBaseUrl)
abstract class TicketsApiService {
  factory TicketsApiService(Dio dio) = _TicketsApiService;

  @GET(musicTicketHeadline)
  Future<HttpResponse<List<MusicTicketModel>>> getMusicTickets();

  @GET(searchTicketsHeadline)
  Future<HttpResponse<List<SearchTicketModel>>> getSearchTickets();
}
