import 'package:go_router/go_router.dart';
import 'package:widgets_app/Presentation/Screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/buttons',
      builder: (context, state) => const ButtonScreen(),
    ),
    GoRoute(
      path: '/cards',
      builder: (context, state) => const CardScreen(),
    ),
  ],
);