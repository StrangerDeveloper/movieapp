import 'package:get_it/get_it.dart';
import 'package:movieapp/data/repo.dart';
import 'package:movieapp/presentation/home/bloc/movie_bloc.dart';
import 'package:movieapp/presentation/movie_details/bloc/movie_detail_bloc.dart';
import 'package:movieapp/presentation/movie_details/widgets/bloc/video_player_bloc.dart';

final sl = GetIt.instance;

class ServiceLoctor {
  static void init() {
    sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImp());

    sl.registerFactory(() => MovieBloc(sl()));
    sl.registerFactory(() => MovieDetailsBloc(sl()));
    sl.registerFactory(() => VideoPlayerBloc(sl()));
  }
}
