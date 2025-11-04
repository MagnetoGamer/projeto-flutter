import 'package:get_it/get_it.dart';
import '../../domain/repositories/character_repository.dart';
import '../../domain/repositories/film_repository.dart';
import '../../domain/repositories/chat_repository.dart';
import '../../infrastructure/repositories/character_repository_impl.dart';
import '../../infrastructure/repositories/film_repository_impl.dart';
import '../../infrastructure/repositories/chat_repository_impl.dart';
import '../../infrastructure/datasources/remote/character_api.dart';
import '../../infrastructure/datasources/remote/film_api.dart';
import '../../infrastructure/datasources/remote/chat_api.dart';
import '../../infrastructure/datasources/local/chat_local_storage.dart';
import '../../infrastructure/datasources/local/film_cache.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  // Data Sources - Remote
  getIt.registerLazySingleton<CharacterApi>(() => CharacterApi());
  getIt.registerLazySingleton<FilmApi>(() => FilmApi());
  getIt.registerLazySingleton<ChatApi>(() => ChatApi());

  // Data Sources - Local
  getIt.registerLazySingleton<ChatLocalStorage>(() => ChatLocalStorage());
  getIt.registerLazySingleton<FilmCache>(() => FilmCache());

  // Repositories
  getIt.registerLazySingleton<CharacterRepository>(
    () => CharacterRepositoryImpl(getIt<CharacterApi>()),
  );
  getIt.registerLazySingleton<FilmRepository>(
    () => FilmRepositoryImpl(getIt<FilmApi>(), getIt<FilmCache>()),
  );
  getIt.registerLazySingleton<ChatRepository>(
    () => ChatRepositoryImpl(getIt<ChatApi>(), getIt<ChatLocalStorage>()),
  );
}

