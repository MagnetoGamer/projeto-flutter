import 'package:go_router/go_router.dart';
import '../pages/login/login_page.dart';
import '../pages/home/home_page.dart';
import '../pages/character_details/character_details_page.dart';
import '../pages/film_details/film_details_page.dart';
import '../pages/chat/chat_page.dart';
import '../core/constants/app_routes.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: AppRoutes.login,
    routes: [
      GoRoute(
        path: AppRoutes.login,
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: AppRoutes.home,
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.characterDetails,
        name: 'character-details',
        builder: (context, state) {
          final characterId = state.pathParameters['id'] ?? '';
          return CharacterDetailsPage(characterId: characterId);
        },
      ),
      GoRoute(
        path: AppRoutes.filmDetails,
        name: 'film-details',
        builder: (context, state) {
          final filmId = state.pathParameters['id'] ?? '';
          return FilmDetailsPage(filmId: filmId);
        },
      ),
      GoRoute(
        path: AppRoutes.chat,
        name: 'chat',
        builder: (context, state) => const ChatPage(),
      ),
    ],
  );
}

