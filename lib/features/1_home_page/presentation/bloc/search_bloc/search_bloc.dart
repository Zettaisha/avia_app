import 'package:avia_app/core/resources/data_state.dart';
import 'package:avia_app/features/1_home_page/domain/usecases/get_search.dart';
import 'package:avia_app/features/1_home_page/presentation/bloc/search_bloc/search_event.dart';
import 'package:avia_app/features/1_home_page/presentation/bloc/search_bloc/search_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchTicketsBloc extends Bloc<SearchTicketsEvents, SearchTicketsState> {
  final GetSearchTicketsUseCase _getSearchTicketsUseCase;
  SearchTicketsBloc(this._getSearchTicketsUseCase)
      : super(const SearchTicketsLoading()) {
    on<GetSeachTickets>(onGetSearchTickets);
  }

  void onGetSearchTickets(
      GetSeachTickets event, Emitter<SearchTicketsState> emit) async {
    final dataState = await _getSearchTicketsUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(SearchTicketsDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(SearchTicketsError(dataState.error!));
    }
  }
}
