import 'package:avia_app/core/resources/data_state.dart';
import 'package:avia_app/core/usecases/usecase.dart';
import 'package:avia_app/features/1_home_page/domain/enitites/search_ticket.dart';
import 'package:avia_app/features/1_home_page/domain/repository/search_ticket_repository.dart';

class GetSearchTicketsUseCase
    implements UseCase<DataState<List<SearchTicketEntity>>, void> {
  final SearchTicketRepository _searchTicketRepository;
  const GetSearchTicketsUseCase(this._searchTicketRepository);

  @override
  Future<DataState<List<SearchTicketEntity>>> call({void params}) {
    return _searchTicketRepository.getSearchTickets();
  }
}
