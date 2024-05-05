import 'dart:io';

import 'package:avia_app/core/resources/data_state.dart';
import 'package:avia_app/features/1_home_page/data/data_sources/remote/tickets_api_service.dart';
import 'package:avia_app/features/1_home_page/data/models/music_ticket.dart';
import 'package:avia_app/features/1_home_page/domain/repository/ticket_repository.dart';
import 'package:dio/dio.dart';

class MusicTicketRepositoryImpl implements MusicTicketRepository {
  final TicketsApiService _ticketsApiService;

  MusicTicketRepositoryImpl(this._ticketsApiService);
  @override
  Future<DataState<List<MusicTicketModel>>> getMusicTickets() async {
    try {
      final httpResponse = await _ticketsApiService.getMusicTickets();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        return DataSuccess(httpResponse.data);
      } else {
        return DataFailed(DioException(
            requestOptions: httpResponse.response.requestOptions,
            error: httpResponse.response.statusMessage,
            response: httpResponse.response,
            type: DioExceptionType.badResponse));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
