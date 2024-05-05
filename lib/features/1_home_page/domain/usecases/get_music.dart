import 'package:avia_app/core/resources/data_state.dart';
import 'package:avia_app/core/usecases/usecase.dart';
import 'package:avia_app/features/1_home_page/domain/enitites/music_ticket.dart';
import 'package:avia_app/features/1_home_page/domain/repository/ticket_repository.dart';

class GetMusicTicketsUseCase
    implements UseCase<DataState<List<MusicTicketEnitity>>, void> {
  final MusicTicketRepository _musicTicketRepository;

  GetMusicTicketsUseCase(this._musicTicketRepository);

  @override
  Future<DataState<List<MusicTicketEnitity>>> call({void params}) {
    return _musicTicketRepository.getMusicTickets();
  }
}
