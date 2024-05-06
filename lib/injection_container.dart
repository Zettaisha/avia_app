import 'package:avia_app/features/1_home_page/data/data_sources/remote/tickets_api_service.dart';
import 'package:avia_app/features/1_home_page/data/repository/music_ticket_repo_impl.dart';
import 'package:avia_app/features/1_home_page/domain/repository/ticket_repository.dart';
import 'package:avia_app/features/1_home_page/domain/usecases/get_music.dart';
import 'package:avia_app/features/1_home_page/presentation/bloc/homepage_bloc.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // dio
  sl.registerSingleton<Dio>(Dio());

  // dependencies
  sl.registerSingleton<TicketsApiService>(TicketsApiService(sl()));
  sl.registerSingleton<MusicTicketRepository>(MusicTicketRepositoryImpl(sl()));

  // use cases
  sl.registerSingleton<GetMusicTicketsUseCase>(GetMusicTicketsUseCase(sl()));

  // blocs
  sl.registerFactory<MusicTicketsBloc>(() => MusicTicketsBloc(sl()));
}
