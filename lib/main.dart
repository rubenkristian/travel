import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:travel/providers/review_provider.dart';
import 'package:travel/providers/travel_provider.dart';
import 'package:travel/screens/detail_travel.dart';
import 'package:travel/screens/list_travel.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final travelProvider = TravelProvider();
  travelProvider.loadTravelList();

  final reviewProvider = ReviewProvider();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: travelProvider),
        ChangeNotifierProvider.value(value: reviewProvider),
      ],
      child: TravelApp(),
    ),
  );
}

final GoRouter routes = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (context, state) => ListTravel(),
      routes: <RouteBase>[
        GoRoute(
          path: '/travel/:id',
          builder: (context, state) {
            final travelId = state.pathParameters['id'] ?? '';
            return DetailTravel(travelId: int.parse(travelId));
          },
        ),
      ],
    ),
  ],
);

class TravelApp extends StatelessWidget {
  const TravelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: routes);
  }
}
