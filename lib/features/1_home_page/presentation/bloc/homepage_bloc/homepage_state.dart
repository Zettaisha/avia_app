import 'package:avia_app/features/1_home_page/domain/enitites/music_ticket.dart';
import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';

abstract class HomepageState extends Equatable {
  final List<MusicTicketEnitity>? musicTickets;
  final DioException? error;

  const HomepageState({this.musicTickets, this.error});

  @override
  List<Object> get props => [musicTickets!, error!];
}

class MusicTicketsLoading extends HomepageState {
  const MusicTicketsLoading();
}

class MusicTicketsDone extends HomepageState {
  const MusicTicketsDone(List<MusicTicketEnitity> musicTicket)
      : super(musicTickets: musicTicket);
}

class MusicTicketsError extends HomepageState {
  const MusicTicketsError(DioException error) : super(error: error);
}
