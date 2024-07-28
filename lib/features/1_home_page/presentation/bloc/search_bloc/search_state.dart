import 'package:avia_app/features/1_home_page/domain/enitites/search_ticket.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class SearchTicketsState extends Equatable {
  final List<SearchTicketEntity>? searchTickets;
  final DioException? error;

  const SearchTicketsState({this.searchTickets, this.error});

  @override
  List<Object> get props => [searchTickets!, error!];
}

class SearchTicketsLoading extends SearchTicketsState {
  const SearchTicketsLoading();
}

class SearchTicketsDone extends SearchTicketsState {
  const SearchTicketsDone(List<SearchTicketEntity> musicTicket)
      : super(searchTickets: musicTicket);
}

class SearchTicketsError extends SearchTicketsState {
  const SearchTicketsError(DioException error) : super(error: error);
}
