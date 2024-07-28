import 'dart:io';

import 'package:avia_app/core/resources/data_state.dart';
import 'package:avia_app/features/1_home_page/data/data_sources/remote/tickets_api_service.dart';
import 'package:avia_app/features/1_home_page/domain/enitites/search_ticket.dart';
import 'package:avia_app/features/1_home_page/domain/repository/search_ticket_repository.dart';
import 'package:dio/dio.dart';

class SearchTicketsRepoImpl implements SearchTicketRepository {
  final TicketsApiService _ticketsApiService;
  const SearchTicketsRepoImpl(this._ticketsApiService);

  @override
  Future<DataState<List<SearchTicketEntity>>> getSearchTickets() async {
    try {
      final httpResponse = await _ticketsApiService.getSearchTickets();
      if (httpResponse.response.statusCode == HttpStatus.ok) {
        final List<SearchTicketEntity> tickets = httpResponse.data;
        return DataSuccess(tickets);
      } else {
        return DataFailed(DioException(
          requestOptions: httpResponse.response.requestOptions,
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
        ));
      }
    } on DioException catch (e) {
      return DataFailed(e);
    }
  }
}
