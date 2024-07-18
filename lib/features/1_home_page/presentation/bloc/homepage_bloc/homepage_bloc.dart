import 'package:avia_app/core/resources/data_state.dart';
import 'package:avia_app/features/1_home_page/domain/usecases/get_music.dart';
import 'package:avia_app/features/1_home_page/presentation/bloc/homepage_bloc/homepage_event.dart';
import 'package:avia_app/features/1_home_page/presentation/bloc/homepage_bloc/homepage_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MusicTicketsBloc extends Bloc<MusicTicketsEvents, HomepageState> {
  final GetMusicTicketsUseCase _getMusicTicketsUseCase;
  MusicTicketsBloc(this._getMusicTicketsUseCase)
      : super(const MusicTicketsLoading()) {
    on<GetMusicTickets>(onGetMusicTickets);
  }

  void onGetMusicTickets(
      GetMusicTickets event, Emitter<HomepageState> emit) async {
    final dataState = await _getMusicTicketsUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(MusicTicketsDone(dataState.data!));
    }

    if (dataState is DataFailed) {
      emit(MusicTicketsError(dataState.error!));
    }
  }
}
